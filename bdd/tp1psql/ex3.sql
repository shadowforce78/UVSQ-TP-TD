   SET SERVEROUTPUT ON;

create or replace procedure afficher_anciens_employes (
   p_n in number
) is
   v_ename1 emp.ename%type;
   v_date1  emp.hiredate%type;
   v_ename2 emp.ename%type;
   v_date2  emp.hiredate%type;
begin
   select e1.ename,
          e1.hiredate,
          e2.ename,
          e2.hiredate
     into
      v_ename1,
      v_date1,
      v_ename2,
      v_date2
     from (
      select ename,
             hiredate,
             rank()
             over(
                 order by hiredate
             ) as rang
        from emp
   ) e1,
          (
             select ename,
                    hiredate,
                    rank()
                    over(
                        order by hiredate
                    ) as rang
               from emp
          ) e2
    where e1.rang = p_n
      and e2.rang = p_n + 1;

   dbms_output.put_line('Le '
                        || p_n
                        || 'ème plus ancien employé est : '
                        || v_ename1
                        || ' (embauché le '
                        || to_char(
      v_date1,
      'DD/MM/YYYY'
   )
                        || ')');
   dbms_output.put_line('Le '
                        ||(p_n + 1)
                        || 'ème plus ancien employé est : '
                        || v_ename2
                        || ' (embauché le '
                        || to_char(
      v_date2,
      'DD/MM/YYYY'
   )
                        || ')');

exception
   when no_data_found then
      dbms_output.put_line('Aucun employé trouvé pour le rang spécifié.');
   when others then
      dbms_output.put_line('Une erreur est survenue : ' || sqlerrm);
end;
/