Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E85D3574F7A
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jul 2022 15:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238976AbiGNNn2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jul 2022 09:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239685AbiGNNnZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jul 2022 09:43:25 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D38E6113A
        for <linux-mips@vger.kernel.org>; Thu, 14 Jul 2022 06:43:23 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26EDcs8v026608;
        Thu, 14 Jul 2022 13:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=+k6fyfWnzm+gKmGrhYt8lNjurzI/EChEGMOK+1yiK3U=;
 b=pfYucTWesd7Q4ZVTZ7V5ivqSj4KqsSLR24tUh6OVIuHDWQ2u3C5lXfiXHsaJvz4rgO+y
 WevTksXSScDigYN1Nq0fRdbF4xdTCuPm4OJQbc9AGYNVJBN3fQJc+T7T39MV8TrcCqWl
 zArJYMGcCPK0J/Fi/V/urtN7hcSTz6BCPALm/e0epwle9J5dUNSEu3K+2ieyY6XEXCYm
 Xl6OkHsm5beLdJD8mAZYvHz5rr/8LhBvDohMesuwcRzw3y3izLs/zNeLiosA4HhaVaa9
 TjxFAtWHpGSG+Iv+yydPCW21eLAzcGVgxbylWnxJvJxiOGCs37rqvz6C3Mk1NgKMwsEC kQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71r1cr25-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 14 Jul 2022 13:43:07 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 26EDeIL9024149;
        Thu, 14 Jul 2022 13:43:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3h704695xn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 14 Jul 2022 13:43:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELYeuVPd/HFkWqlZ509iIseKtz+gkjLaJrT+1ZVPgebwxH3H0CLHdUENW/69Gs0oxuLZPux3+8a/DxixHeyUvu9ikX+jPDI+RBDs+GIg6hvf/+d5/wSCuLVOq2aA26j4qCc+o1Ur2GfLFQonJlQLITbXMJTrOX4h3TW22ev9x/+bTdBjmn+BvVrJC8NYlp4dAaR5RwlM1U/CpqxTv8M9J9eSoJCVYoigbzvqpR/38vS8DvQzc0a08fPEmVKhLaoOymo20SeSFRTwf2RLLXP/2wPyK9QRK0COIIKtgZy7m4uAA7NkBvi/bnExZI2x/NhdoWzjVX9JvH3LVpWbtz8eqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+k6fyfWnzm+gKmGrhYt8lNjurzI/EChEGMOK+1yiK3U=;
 b=adWWXX4h+XQ/qZe2jAYCQSVDNkevz0E6GdaP+Oc7u90XDqtMCrzkF3LPjScZv7r6YSSzgspIb40YuvxeC6/ORhKfjNck66VI7LdxsRgoxqlrG0q5gyM/P+LUKPKdNRWEEiHQ44oFXj4XbECleJ5RYIAQIzqEAhCWf+2rkmmO4TLKvC2VtrPqRJJmfb/mbk9YcGgRZbLe6ljA4Uq9AHE4Ez+QHcTEhnKGg8B99LwDn9CKV5/g3N4YIE+0giOmCFQjPPKb6cVFH3AEkrGT8FvLATRAbTUd4qEvlCVyrlqoi9f+i9KxXh0bAzak9TD+U8JRaW7efNM1Zwd4ejQ84JFxXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k6fyfWnzm+gKmGrhYt8lNjurzI/EChEGMOK+1yiK3U=;
 b=GyVb7Znwdwt5Priq7X0ruVajQy90swnciPme4Ym4HQPzNHoI2eA/AJ1knvpiPZf6Hl+ByeJXZ86ynISkW7k4tup33bWMf43U5+0aAppeCP9icfhdzm9lBUGND6/+yE3GIAlukxbCRhXZbhcUpbp4/UaxTXEhcmIx5KLvnrm1Rhw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3496.namprd10.prod.outlook.com
 (2603:10b6:a03:125::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Thu, 14 Jul
 2022 13:43:03 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 13:43:03 +0000
Date:   Thu, 14 Jul 2022 16:42:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     sohu0106 <sohu0106@126.com>
Cc:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        security@kernel.org
Subject: Re: buffer overflow in vpe_write() function of arch/mips/kernel/vpe.c
Message-ID: <20220714134254.GS2316@kadam>
References: <71b5d25.71d1.181fcd701cf.Coremail.sohu0106@126.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71b5d25.71d1.181fcd701cf.Coremail.sohu0106@126.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0040.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f6f9255-12f9-4e17-8fb4-08da659ec648
X-MS-TrafficTypeDiagnostic: BYAPR10MB3496:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QhkZvpjjIEoA2oXxqaRkDd5Loit8+rJ/gvcAdU2klFAH0ToxigGdzLoRA3+PMOG9Hez3MVdXO9rALvji/ve5ETeSX4TXM+7Y9m27CQL16+a0+qvT0kcEqBcOFtp11z9vmJ15o38ZE5qwq+9XIcGMrmBhPtZsOzfrcechH1u/mWXuXbEA2bDfBz5jrK0Gd5b/tVvDD8DdXjQcXZ+feIY30kNAFA3uaTQYvw0F0vx9JUh4daZaqd1nXuP11dRDLqLEr0gFGwtNLEz1SzlB+PhDIlXV/IeXjEJN3w+cqwLwX8kFKQGul4MfpGPKziAWC2l44fSh+5f3KfridaZqeKczWWvD63g4bv/cKEupOnppfFcd7cxzYf40PB5eICvcNcZXJahv2w+figCQZxCJJ8OmIUn7q6D8DAnhGrzbizklvVJ7nsqSh0lH6EdBLeGhQIZ897E68mpfhCDMGip8qxERW49IUCnMptuuKa0IjVe9jAlvxlPDdT01IrdM5f2miRKpqw10EjKeHMxScURlBekNUyQ97mTRvMjHiQt83iz/mf94JsWluUI6X2HYvvzL8w7/eB6sMUIlkm7xjXLdhhRspDGdHyr1DhbJ79Uw1wKVDFd3MMOfgLVenuHxqwr9CnkNqIgpYOzlNlEInhv1D12MrrB8j7u7tBVt9EVzCUUKYtzt6YN9XC460XiEw11x19jYBSZlVUDn4JkbUiGll3B/N7pE5i5YQwwio/NgM65uMgswfcnAji3zeeUKtVi6/MoG5IGl+6EkcyxKz6gq6P8jI7Z5rWE6Uo/P0YdEHFEPl3ZeHBt93o3rS3FAmK0iNnP7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(376002)(396003)(39860400002)(366004)(136003)(5660300002)(1076003)(186003)(66476007)(44832011)(66556008)(33716001)(4326008)(6512007)(52116002)(26005)(66946007)(6506007)(8676002)(41300700001)(6486002)(9686003)(478600001)(6666004)(33656002)(2906002)(8936002)(6916009)(38350700002)(38100700002)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5CQPy7ffrRRp/G7bVSx7jx410QZSQNIQEYGzizAPu9Fv9zYMIWtHvFVkiHzN?=
 =?us-ascii?Q?fC9RxDdmvwP66l8coRptDYYoCwpce5nzrac4bAJYmDjVCr1vXgWLmu09cSUN?=
 =?us-ascii?Q?nxgsmM5YiDLGVJodyzOcv7zkUMoVTOCUmL8ebjM7Z08fjJQP9VX7LvzB9mdO?=
 =?us-ascii?Q?H26TyP/JpT/T/0LiPVlXjnyoi3WF2v7t+5Y6kIKc6nUlvfGgFWbaooQyQEAn?=
 =?us-ascii?Q?2yu2XjEn0yCPOuZNGShXFHELSCDurjHamvzRdTOvH1kOGsbwcQB5bxsRk0wl?=
 =?us-ascii?Q?wzwsSFTeir/LYZI2ZFQ1E32Ea7Z6Xq0u5ueuYlJsOpjlfg85kRa6SIjhR47z?=
 =?us-ascii?Q?bsvIp/REHSu+8fBW9EFCmINCC+6EbBM9cKNMm44JENw1uEW/9gdNqMSq/wzI?=
 =?us-ascii?Q?+HSJtUxQjwrgx2DkQBVa6+sF7fK9sGlnxVLlugotgrMRyunlxpuz+tBM0nzX?=
 =?us-ascii?Q?N8YF+2ByVm6CwJ/O3qkaFlH10q8S2CmMJXB+qnmOLlX2ZDsHjRDi1EZ9YSXW?=
 =?us-ascii?Q?5U1G+WjVNrpiiZpLU9zMvIhPA/Sld2xeKyBwwA5AmxgKq4ESYydwaaYqRXLj?=
 =?us-ascii?Q?0ejz9vQ7ySGDFgcu5ieZGMkeXaL706/jKROfbyOJMZWjdo4bm5yb0LCNXZut?=
 =?us-ascii?Q?7zh+Gu3ceA6VFfkt46hWKIhVZrsiuYrV2LILGWPavjvNvmVPA57Lap7u1Kr0?=
 =?us-ascii?Q?9Yr31YWMFS8O2ikL3h9at9wtitOHVw93VV/8hYmLxGyKL6Tyq5XV8LxPDwGM?=
 =?us-ascii?Q?hJdqMxYjPVKmw3aZ1rp+DiPOCl2vZKdR2wtILozMh+Z6PSmvY421ldRmHxNu?=
 =?us-ascii?Q?n1LKp1It36jFYaA767asKZNBhjBaTgk9mS9bdG4jyw6YFpud+LpvPCoUN2RV?=
 =?us-ascii?Q?7GAbowDsFagW5fVRljEYQ+YpgNYWqWRlVlwpdGE4/eDr/rBtOb575iHPkXdD?=
 =?us-ascii?Q?ENSawRRzfPVtDy23Wi5S+C8eT9M53CnjclQ4pHXCanZGmD54CFl1QeQ0JpyX?=
 =?us-ascii?Q?oVLwg5DMAQuQ2ozpON5OW5UMUMfyex33adUTdRIICs7oPJ13iY0wNnCGTDCh?=
 =?us-ascii?Q?SFEM0iFGIifgjd6EnUy/0LeMrsqU9Z715lXW6Hq/p1NqSZV982DvAsySzmkQ?=
 =?us-ascii?Q?XRJl6UA0Tf+MpRQEq5F/YNhhDpVvAk9NMi00GIl02PIzW5UIvkGISR4qL8vL?=
 =?us-ascii?Q?xNF0s3hTzdMgzbGnmweuTZUSojF1Fjt/ApJFgdqTsObdTrX+kKl42+9y3Z33?=
 =?us-ascii?Q?CBFojgZwYegiQs/x2e+JAJuooQjWFmdamzLBMhCq6OQd4T4MnSvyGOrJwklZ?=
 =?us-ascii?Q?pUzW4wf5GEHso4fyJyn/tV8dwL+x57LS5CaEj5JsQmZwo51cbA/AX2PbDWaq?=
 =?us-ascii?Q?Z8oLEedjJuVdWNU/Xj8Q8Zi5udeUlgdWjytqdz6dLCjE5wO9cPcoOX5yx6kq?=
 =?us-ascii?Q?0/rzMG9sbVqOeLMDJAWKaCZMHVjRNu+Ps38J85ArfXiQ47F5XyYIzojpTVp8?=
 =?us-ascii?Q?bDFyAsbVfts0+6J4faO+HqlfwlQJ0TJLQ7jZ231Sx/8QGpEcP2SPHTVjLPgR?=
 =?us-ascii?Q?lUkcQjLuTQGIMQObY0spUHs8hzxvl+u2gcrwB7+b08yYcU0Z+P6K/+CZfGID?=
 =?us-ascii?Q?uw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6f9255-12f9-4e17-8fb4-08da659ec648
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 13:43:03.5666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBnQDF9cUk87i3zyGibGWTuhCEoicd/xx6Mi6H5DjTFqtvyW65gpA4EAndp8Cg/NrCOFcwvsD7j3YdeNYB1R4+GOcSsjYqScVmMPQPeCFuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3496
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-14_10:2022-07-14,2022-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207140058
X-Proofpoint-ORIG-GUID: tTaZuZ2vd3xljNoj-PDqn0DMOfMkw1z8
X-Proofpoint-GUID: tTaZuZ2vd3xljNoj-PDqn0DMOfMkw1z8
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 14, 2022 at 09:12:38PM +0800, sohu0106 wrote:
> 
> In the vpe_write function of arch/mips/kernel/vpe.c, parameter "size_t count" is pass by userland, if "count" is very large, it will bypass the check of "if ((count + v->len) > v->plen)".(such as count=0xffffffffffffffff). Then it will lead to buffer overflow in "copy_from_user(v->pbuffer + v->len, buffer, count)".
> 
> 
> diff --git a/arch/mips/kernel/vpe.c_org b/arch/mips/kernel/vpe.c
> index d0d832a..bd1f826 100644
> --- a/arch/mips/kernel/vpe.c_org
> +++ b/arch/mips/kernel/vpe.c
> @@ -871,7 +871,7 @@ static ssize_t vpe_write(struct file *file, co  nst char __user *buffer,
>         if (v == NULL)
>                 return -ENODEV;
> 
> -       if ((count + v->len) > v->plen) {
> +       if ((count + v->len) > v->plen || count + v->len > v->len)   {

This integer overflow check is wrong.  It should be < instead of >.
Also do the integer overflow check first before the other check.  I
would normally write it like so:

	if (count > ULONG_MAX - v->len ||
	    count + v->len > v->plen) {
		pr_warn("VPE loader: elf size too big. Perhaps str  ip unneeded symbols\n");
		return -ENOMEM;
	}

There are some other mechanical issues with the patch.

1) It needs a subsystem prefix:

Subject: [PATCH] MIPS: vpe: fix integer overflow in vpe_write()

2) The commit description needs to be line wrapped at 75 characters
(Run scripts/checkpatch.pl on your path).

3) We need a Signed-off-by line.

4) The patch cannot apply.  Use `git diff /arch/mips/kernel/vpe.c` to
generate the patch.  (There are other ways to generate patches.  Read
Documentation/process/submitting-patches.rst or google for how to send
a first kernel patch).

regards,
dan carpenter

