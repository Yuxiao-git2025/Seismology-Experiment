function sigma=strain_stress(e,lamda,mu)
   %constitutive equation is:sigma_ij=lamda*sita*delta_ij+2*mu*e_ij;
   %for sita=e_kk=e_11+e_22+e_33;
   sigma=zeros(3,3);
   sita=sum(diag((e)));
   
   for i=1:length(sigma)
      sigma(i,i)=lamda*sita+2*mu*e(i,i);
   end
   for i=1:length(sigma)-1
     for j=i+1:length(sigma)
      sigma(i,j)=2*mu*e(i,j);
      sigma(j,i)=sigma(i,j);
     end
   end
end
  