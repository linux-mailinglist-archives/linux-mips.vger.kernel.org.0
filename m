Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 908C55750A8
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jul 2022 16:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbiGNOWV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jul 2022 10:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbiGNOWU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jul 2022 10:22:20 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA2764E1D
        for <linux-mips@vger.kernel.org>; Thu, 14 Jul 2022 07:22:20 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26EDckV3000894;
        Thu, 14 Jul 2022 14:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=jkDs7tQLemK5ES5GahiO/rFTVxjvjQlNuuBgddue/qY=;
 b=x88b03vPppFviTYgz+yA7LFVKiQSIJ8eLmXAWrWXFreDvfAH/LhlFVDNiSe759x3w5Fn
 DYwHUrukdGHbwhrvnJJUMsbzVsWDrV0IcGD1HQWAx5R1WUUiy5hWpX7omwsinrCnVMYf
 JftWBQlLssROKz3lxyK0mpAeL60hpLewlw/N2ug2EOK6A4wJajkVqTnCeSVYWkmPiAIk
 th+PsZilraXqdZ57XU9LPMdHLWny/XAdVVng3VSyYnSpAXsoV48rKGILYGwBoO1VkPG0
 EvKCl7S518bpGEG//ttUzxXztJJexEPt8QiQcYG2QJgqybA3ai1vLenTxXiv9DBRbSOt vQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71xrn91v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 14 Jul 2022 14:21:59 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 26EEC9GP015964;
        Thu, 14 Jul 2022 14:21:58 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3h70469xq6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 14 Jul 2022 14:21:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oe18H1KgGw7PydLb8GFjMPOcCqLvhYlHR13pQExKUJITlSzY4yFZDFeelG6sJQTqSK66H2re3fNd5NNnRoHtC8jxR2tWhLdG+dG4iVOQRPYM4vXpsVoVU4gKAz1GpdR16Plgag25ThOMAtnSaTjmhyseQA8VKje2Yl4nY/Iyz6jSXUm5pxDUTJ8Ac18JlBpuT7mrozSV19DvIQk5eNLsqtN1xOaoceYsUYeN+t6tszY2sNAWGSZt01cO6m3UgOO8jeDw4qhuM56TwZELUi1qpIB2MeH3ZFd+2VpJynD4EtD/sVOEamONuZsunSi6isPnDr7kN10BAu8GHx2rDVNulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkDs7tQLemK5ES5GahiO/rFTVxjvjQlNuuBgddue/qY=;
 b=VkLTPDmF00ZWy8jCG4C9dw6ruqTomNIBd5pZVrKEsvDrz8kh9hBmeAuxfxMylKgjR58sJzIFwB5q3sMXEq4x5xXTQid6P8lroz8ejKyl54oBkh1RvTuER+zRexXZXmETHsz00suQ3MMs+HxS6HiVwD75WORQ26L7flx9d9cpDVbWhS+XFLm+qYDyntfqOY8plokRjfzJqf3DgIo6rAs+2EjG+717fyIuuYJzwEmbu6CC/OlzYMkUp5SfyNo6kAecxW6SwvU+1ANoilim8uVwx+gk5rWTs8VmB14jQMoXcDGbjjeON4Pu+Xf3gUKI0Eumqsi26gBP3vb9mJ27G4fiIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkDs7tQLemK5ES5GahiO/rFTVxjvjQlNuuBgddue/qY=;
 b=xPZkENv+WtF3wX5EJh9YYHWQpiR1iUaGIcPq3jcWkMbEE36l8/KkdyZJnI7Wv66TAMYAr1LR0OXNMBvEz0mDMUeBe25+ykT7XsHF1KIVcFmjFi8xDtf9krnE8op1PZ+mxyjgQdQxot1ancdC8rfNwBh/te5F8KyoqZjiMOio+w4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB4725.namprd10.prod.outlook.com
 (2603:10b6:510:3e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Thu, 14 Jul
 2022 14:21:56 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 14:21:56 +0000
Date:   Thu, 14 Jul 2022 17:21:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ning Qiang <sohu0106@126.com>
Cc:     greg@kroah.com, security@kernel.org, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de
Subject: Re: [PATCH] MIPS: vpe: fix integer overflow in vpe_write()
Message-ID: <20220714142145.GT2316@kadam>
References: <20220714141705.2375-1-sohu0106@126.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714141705.2375-1-sohu0106@126.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR2P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::26) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 648f8709-63f3-4f3a-575f-08da65a434a3
X-MS-TrafficTypeDiagnostic: PH0PR10MB4725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IUvDWTtB9pV+mUS6iTiOPmojHcMDjHXssGrZxy0RgkerzsdLzJ5Mbs5pJyd7/e3aJ7+rLQGIBPmqI9IeRmEIVr/4LJ4YmVuIi5pmbIwgEoOAoOCtGkDwvwvdGzsJFhpt7xithOb78S7h8VkhZUq5B7Mh0XdmbJvezHpR1vAwu6VDBHeilQTKVpgPzxb7YaqRZcRfcQpySbXZfx4Rn6ix6tq9iFUETMi7C3GCoC3kGeuGBjxENkZVDm6F8CncBckp5unjezznrb+sdMQkYeiKGeH+l9MFpYhgTKHb4hbgpMGTr4fwcA7DrBAYSt0UYSmh4bEhpV4hihOUa1AbW0lZuhGgTsTVzu4mmrC0lYhRcsKsB7AIABO2R3mJIPflJvNZJCmhwFixgTTh/XnzCetpOZWAQ63j7fL2+49l6hCQdWVPML2LjX+uPI56O0oQ7sokWOvNvr+2YEQV6j35Z4zdXFdJv1VkMmth114PzoxEqwP/rb3VGLYmzuY7oJfDcax5H/8/n6XRiA0cHr+GSLlRLAhzGQij6H4cvutES5boDh5tcEMLIs3IrwRDMATdRJ1UjFdHbz+XcNoCXfIG8UOQputJP58OcasxLgMW8JNfKyGFzS+aXx7GX6soqTA5M/IDHf6hN48BfvI608MoLD+haDlWXCydi/kl/hB8ItlEgxGtdxniKu94T7D0by1UerYRMb+/dEm0u9b5QrgNzabn7R+7WRaz9o5Ztp3wqTH67z4lLhMNLiqkVirhfnd2V2hmD33K0lzco+urL5jNIPlS7mpmKFv1Bka+C0thjPM7Y8H8V3tZfeef9I7Gyn2U6jNJxbSGIYuVYAVgb54H7kFVbj9vu5YVh92Sp8jPQ3Aycy8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(376002)(346002)(396003)(366004)(136003)(39860400002)(66476007)(6512007)(9686003)(52116002)(41300700001)(478600001)(26005)(5660300002)(44832011)(4744005)(1076003)(6666004)(38350700002)(6486002)(8936002)(33656002)(6506007)(38100700002)(316002)(6916009)(86362001)(33716001)(2906002)(186003)(8676002)(66946007)(4326008)(66556008)(525324003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VjhnWt+RCBVWqSRwxPmlE0GBKRTJv6JzIWc9aicGkzHD3MC2NL3Wyl9rsqsu?=
 =?us-ascii?Q?NhsiIg5kx0du1mLQqep3R6EmmSOrb7yXk/mkMJzCN7FdoSTAfOx/qkujqwqC?=
 =?us-ascii?Q?ys0pyUlLz9kzZoCzx9RC/FxQmqxYFR7pn+iIfQP8vUBnvY27bH1WgPwHhlPI?=
 =?us-ascii?Q?E2xicUXXiBt46ZeZxgQ2yLwNQHCMLXG9pTLPbYTu5av79H5PAsZ5Dm+Xzzgt?=
 =?us-ascii?Q?jz1fWKZsVD+uzbGEJTUWB9XFurPux2IS/rMG96nf+5srieicVSCYxucK5zJy?=
 =?us-ascii?Q?DwGot0XpQM4TtEvR4W6WODduzU0Ec2sxyvB/wxSdjmclNqOIjcMeSfYaMBRg?=
 =?us-ascii?Q?WlPOZu0YCbBIvRTT4I+45ZC46xDBjO978tGYIHlYbLRvRucFalmooqZKMBS1?=
 =?us-ascii?Q?eGvg4Xp47RK74CIyPLONgATrQgzVYsV0tyRwtuXiO064IXN6DdQHNw7UkLCa?=
 =?us-ascii?Q?Zg+na5wa/Ynen0wyW4aOO9pcVPRe3K6IgyLKFh8k/FMLEiwk7TzJRRfKJ88P?=
 =?us-ascii?Q?wwEoYpcZAqWI+1oeqSCEKnm2wtyHZ3cBnaX9tjN8NrzajcnetYAVaHpAm3pH?=
 =?us-ascii?Q?HAxtnY/izmztpTAGcGwYmaVxEvnyCTe4nw68WV5RA/dJJJ9wkPwGL13FZYOQ?=
 =?us-ascii?Q?H/kj84efoq5RVbnQDdyFvuTyAz9ZVKwPnb73kLj6teXTPd7ZGJgm5nK0/Xme?=
 =?us-ascii?Q?ZEhMcITKmD9oDFWcdrgeyu+Puzjo2nybCGV8xxDiZhT7MqHesvHGqaNw5l2d?=
 =?us-ascii?Q?8XIRkdrpiaXRYSspwUQFlHG+dRJLkDHJpwBs+XIznPtXL85TK6y67M0LuY4O?=
 =?us-ascii?Q?fAfsNKXH4QB22O9QUG910v0smtlZL9dAnbiZp3a8BzTqvdxnpRfVi48OKbXw?=
 =?us-ascii?Q?Qtpru7jMDm4fxZCJRbS1msqIjSB9cRyhasS5l7t2XCkiegVoGhvsupQUhnU+?=
 =?us-ascii?Q?z6efQ9AEStViJ50FsHhneBRB5ZfEf7zG2HhsvwC6sUKk4WlodeB9XUScTRxl?=
 =?us-ascii?Q?q5vKzUMoBd4bUufxZK7NukCjNrWvXse5IQ3289DctGsHbatuNtgLmvY55jq6?=
 =?us-ascii?Q?BGtMY7k6elP323g+CMePeBnPpfuSJwWCh1F3NDH6v+4RggHQXy7CMNWnT7dA?=
 =?us-ascii?Q?KuTsDjw1OrfDuLf1JsDHxpff/JJVdNimaNtznWccG7xTQM+G6hk+CN1wVfhE?=
 =?us-ascii?Q?LSecBQlQOClMJqvA6hv6yEsGM8u7kVfy8lpsPszKBQqo7m5PdGDdrzTCZIKY?=
 =?us-ascii?Q?siyQvf8ybnsFETCCft/X6USEhEjZ+fkxq9bH0LEfKaC6E+MBPWKCDybw984N?=
 =?us-ascii?Q?Qohv9p9W9pukJhaCALGbdnVSas1PEztQwG++xECH8k8G/4Q6yuHn1jJ64QH3?=
 =?us-ascii?Q?EZGJ2RdYMj9jRaV/xQWk1zFLJDZu7zilU2mtvE+BUNWHSVPNlYUrxjX4lMFp?=
 =?us-ascii?Q?ax9RADPXufwdlZhDN3OodIbqdl00rXHkwn78RsT3O1Igk+SScFUZubQrImUH?=
 =?us-ascii?Q?d56S3QdCeJ9NE6JfmnhLVYPxeoPgaE/02qs1fyuf6fqKaMkJhJAlJQIGyRhI?=
 =?us-ascii?Q?FLNF6aLa40UB0rhi77O1L6mNtdbDYxFrrXJ8ayTMJ/eUnj/U+3QXNwpdhaBC?=
 =?us-ascii?Q?5A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648f8709-63f3-4f3a-575f-08da65a434a3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 14:21:56.0227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j48yDyn890acrOGSySYkjAEdohTAS4i649T1dQkbJaKIjfDxJZoHrNvSBHltXxBcAzBmpZYc5oqJ37bCvK8KuKCR+sRI+X83X5/efqqs+is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4725
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-07-14_10:2022-07-14,2022-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 mlxscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207140061
X-Proofpoint-GUID: SguZWK-F4mjTXDX6g5HWzz1XGgFUUJMX
X-Proofpoint-ORIG-GUID: SguZWK-F4mjTXDX6g5HWzz1XGgFUUJMX
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 14, 2022 at 10:17:05PM +0800, Ning Qiang wrote:
> In the vpe_write function of arch/mips/kernel/vpe.c,parameter "size_t
> count" is pass by userland, if "count" is very large, it will bypass
> the check of "if ((count + v->len) > v->plen)".(such as
> count=0xffffffffffffffff). Then it will lead to buffer overflow in
> "copy_from_user(v->pbuffer + v->len, buffer, count)".
> 
> Signed-off-by: Ning Qiang <sohu0106@126.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

