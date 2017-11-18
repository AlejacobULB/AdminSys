# AdminSys
Projet INFO-F309: Administration de systèmes

[Latex: Rapport d'analyse](https://www.overleaf.com/11636920fhhzbnhqydjz) 

[Latex: Rapport d'implémentation](https://www.overleaf.com/12281257jnvzbnntpnjr) 

[Tableau de comparaison](https://docs.google.com/document/d/168RMYuq4Ep0hAeY92o6pK7WYBCf9zQ5wtZTn307ikt0/edit?usp=sharing)

[Enonce](http://www.ulb.ac.be/di/algo/secollet/adminsys/projet.pdf)



# Liens utiles pour la installation

## Documentation officielle:

Étape 1. [Pre-flight checklist](http://docs.ceph.com/docs/master/start/quick-start-preflight/)

Étape 2. [Storage Cluster Quick Start](http://docs.ceph.com/docs/master/start/quick-ceph-deploy/)

Étape 3. [Object Storage Quick Start](http://docs.ceph.com/docs/master/start/quick-rgw/)


## Tutoriels d'autres personnes

[Deploy Ceph and start using it: end to end tutorial](https://blog.zhaw.ch/icclab/deploy-ceph-and-start-using-it-end-to-end-tutorial-installation-part-13/)

[Ubuntu 14.04 - Deploy a Ceph Cluster](http://blog.programster.org/ubuntu-14-04-deploy-a-ceph-cluster-part-1)

[How to install a Ceph Storage Cluster on Ubuntu 16.04](https://www.howtoforge.com/tutorial/how-to-install-a-ceph-cluster-on-ubuntu-16-04/)

[My adventures with Ceph Storage](https://www.virtualtothecore.com/en/adventures-ceph-storage-part-1-introduction/)

[A Hands on guide to ceph](https://alanxelsys.com/2016/05/04/a-hands-on-guide-to-ceph/)

[PG calculator](http://ceph.com/pgcalc/)

# Machines Virtuelles 

4 Machines :<br />
1: admin-node <br />
2: node1 <br />
3: node2 <br />
4: node3 <br />

Username/password sur toutes les machines : admin/admin

[Lien vers les fichiers .ova](https://drive.google.com/open?id=1d3xU7Si4vHFo3O0_gkWn83QQp0W8w9pT)

# Scripts 
installNodes.sh : Crée un user nommé "cephUser" avec comme password "ceph" sur tous les noeuds<br />
runInstallNodes.sh : Se connecte en SSH à tous les noeuds pour executer installNodes.sh<br />
<br />
installAdmin.sh : Installe ceph-deploy sur l'admin-node<br />
runInstallAdmin.sh : Se connecte en SSH sur le admin-node et execute instalAdmin.sh<br />

# Hardware recommendations

From RedHat: [Hardware Recommendations](https://access.redhat.com/node/1499443/part-ii-networking-recommendations/)

# Commandes utiles

## Générales
*  Check l'état du cluster : 
    ```
    ceph -s
    ```

## Pool
*  Lister les pools :
    ```
    rados lspools
    ```

*  Créer une pool :
    ```
    ceph osd pool create {pool-name} {pg-num} 
    ```
    
*  Supprimer une pool :
    ```
    ceph osd pool rm {poolname} {poolname} --yes-i-really-really-mean-it  
    ```
    **NOTE: à ne faire que si on veut vraiment certain d'en vouloir supprimer toutes les données du pool {poolname}**
*  Lister les objets dans une pool :
    ```
    rados -p {poolname} ls 
    ```
   
## Objets
*  Ajouter un objet dans une certaine pool : 
    ```
    rados put {object-name} {file-path} --pool={poolname}
    ```
*  Supprimer un objet dans une certaine pool :
    ```
    rados rm {object-name} --pool={pool-name}
    ```



