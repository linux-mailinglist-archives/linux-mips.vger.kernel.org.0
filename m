Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA2F54EBF3
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jun 2022 23:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379006AbiFPVGO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jun 2022 17:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378947AbiFPVGK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jun 2022 17:06:10 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042F260A9B;
        Thu, 16 Jun 2022 14:06:04 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GIdgGG009844;
        Thu, 16 Jun 2022 21:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=2wMpgJCRVKlN/DcMr5p4CoglZow28y7ZBL3d5MPCx5Q=;
 b=ffXIt+X6MDAmQrz9LwSsFzyqb/lOc1PdTjr1MWBakliYJpb9SJpFJkJtA5cwoWBdXEmt
 OmISUvFk9CYM/GStZ/7fcpozs7tQFky78kyvFP3PbRl3WGoZzj44+Y84n1T5u6AmCOTo
 x02xqmiLCHs9oFWKlVx5LpeCwe3bM4wvv/v58ROLCjz3zq+LwlXz5W2KlmONQzw4xLfR
 vG3u5GIWUCiz6smH3NVqLfgwEvz+zGdSBapDQIalAU213+zbRJ83E25yjXN1/UwFyvnQ
 QdpeEOvjhjphTQfC3stPOYt/HYHYuNzf6Fv55Gv4qBjg7fdmaeASF/Q/8/sSi8lq3Xow +A== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmkktmd3w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Jun 2022 21:05:33 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25GL0HTU031914;
        Thu, 16 Jun 2022 21:05:31 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gpr2bpscu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Jun 2022 21:05:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlqLmbqYjc1LT5P1oQ7gOduCcfdgpSwIP4p8QtOKDzgIX8Aji81Sywf71G3J/0sKA1Jhsh0lAcLh+Nb033qLFcYZw8hqYvrDOVVjhLVnKbhGgVUobVq7aGcxXTWVQOXYWRwQmNG9e6X6I7m9fuDsTwt7UVxFT+fvwURx3zfKdfExQgxiQeRE7ByokYhu6+NvTt54d3s2d0QWd9aGymjW07RFEtV1s4Vq2GCcFIWqVGnN5R6t4ByX785yTirKXwqFScuTZfJlIevP4HrUTYgGCrMNmBTQAwj2lRGMi9d+TBW16JFU6BQAam954recyi+QsAi0JJD5UHc3MlFRDJs/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wMpgJCRVKlN/DcMr5p4CoglZow28y7ZBL3d5MPCx5Q=;
 b=dQKHSnp0Quo9SgLu6Ys+8mz+QKuVlNvzTIOhlRsvoCfUCqeFiAjUPa4mFlAHj2ZFVoAfv/Atpk6t4Vi077fLsSe0QVS3afrN2PomZcUD0iyJVhnNvCXdPNjYV4JFkh21P6w8ACZy/CppAbuHOmIMF8o49M9N7wLJpKICbHdZ7bEe8izRnOj0P39nlKuf1kCLaGsFt27TuZN/ZeRRPlE+WxN/JfDiP1zxPKdn6qaG84erA0pijtWpFBXiOTKhtyHv7xU3miIO83bp3qUK87M/giHyYippyDI7cYJeI5MSd0kbnr0BRSDlmyoz+cxkXEwjzR+DxkUB7bu0iRRU1q0FSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wMpgJCRVKlN/DcMr5p4CoglZow28y7ZBL3d5MPCx5Q=;
 b=sLB5BmLewU8AnpW7JYua8VHK4yQEcxWTPobjoJGsBjFiWoRoDcrGURCHKAVjsUcs1KnDecjRhKE9BADul4mCTSIomXuqCv0T99J1eVBExOdSSSO+PUlp6BaZ4GhZXDycz5AN/kslOgzyQPqVP4Z8NoWD7eOU8WVXXElko0zDOak=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by DS0PR10MB6197.namprd10.prod.outlook.com (2603:10b6:8:c3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.22; Thu, 16 Jun 2022 21:05:29 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::2125:9bb7:bfeb:81f9%8]) with mapi id 15.20.5353.015; Thu, 16 Jun 2022
 21:05:29 +0000
From:   Mike Kravetz <mike.kravetz@oracle.com>
To:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     Muchun Song <songmuchun@bytedance.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Michal Hocko <mhocko@suse.com>, Peter Xu <peterx@redhat.com>,
        Naoya Horiguchi <naoya.horiguchi@linux.dev>,
        James Houghton <jthoughton@google.com>,
        Mina Almasry <almasrymina@google.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        catalin.marinas@arm.com, will@kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Kravetz <mike.kravetz@oracle.com>
Subject: [PATCH 2/4] arm64/hugetlb: Implement arm64 specific hugetlb_mask_last_page
Date:   Thu, 16 Jun 2022 14:05:16 -0700
Message-Id: <20220616210518.125287-3-mike.kravetz@oracle.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220616210518.125287-1-mike.kravetz@oracle.com>
References: <20220616210518.125287-1-mike.kravetz@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0237.namprd03.prod.outlook.com
 (2603:10b6:303:b9::32) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24855748-effa-4322-bc1e-08da4fdbf177
X-MS-TrafficTypeDiagnostic: DS0PR10MB6197:EE_
X-Microsoft-Antispam-PRVS: <DS0PR10MB61975DAFD0A026702B3C8CB2E2AC9@DS0PR10MB6197.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J5ac2N9HU2mqaLjIkIcFAdzhT18SHYd/qHgtZkWKt+f139++Oz+f3sr8e/6mvZ3EE+wt/Up1/gmG8ENykFu42WnQTCIgI84kUoJTBi1+4oSrQ8gao2/aSWq2BQ28ad+nXfEvpSIbTA8u8joMoMTrhVf/CyM1+s8CjrZfJENoiB7dEBjqxXyXK3dsmajUy0AG1QP6YLVxVEIvA1bJ71Jqmmyhd1exOHrJElrAAFVFpHDK6/yfX94cumzN0/p8y2TjFhos3kymmQNhtdAdf8r36Yla4ASlHcF5RPBwq+2JSs4IWpvxMLZJbDPyvb2haUsldbTnhDmG4b4h66WkmdhZNGbe1l5JwdCwX7EH94RIvT2t30i425LGpSzsuZYVS51nUCwqAB305RbEEgTs1c3iyiqlHJTELXDN0/N7McfOwF5i953O2CYJtw+lynaSOagKhEp2qUVcmxhySW9dnJek85OtIg5lOA7uD1kFcdcoS7Pfh/L66FPuzhTT9u5apFLbGg4Atoh5FXh/bDoFtNMIazeWvC1PIZFH0TTqrmNAp3sJaoh88FxO61oy+wx3wAaIpV0LVzbHXuV27lXvoyhRd2ggBlzCV/ewnXWJQPNAqliqBV6ylVQu1CM+ULr7fVMk1gkio4ioW20PRYwUPGa5RLXMs9Y/LLbbtitfVbJI3CLDGfE03z7OpMKpFexQqUq+F9s7C5+eMXINCvPMkDeY5nWNF5pYdtQMAWtbBYxnlH3oaNHGZHPWqbPIEzLpj1S/MSECuY8EsmvUL6IiUeonpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(6486002)(38100700002)(6666004)(66946007)(7416002)(83380400001)(316002)(2906002)(66476007)(6506007)(4326008)(8676002)(54906003)(1076003)(498600001)(5660300002)(66556008)(86362001)(26005)(44832011)(36756003)(6512007)(966005)(2616005)(186003)(921005)(8936002)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pQBTpR2kLhxeyBpvihVvNyoT8W83Ivs8o3K5tehfI04ZZ8O/pO/WYEUD+xNm?=
 =?us-ascii?Q?s0fVKt553i0/aOqV6rojo9n0NpWVwxj8qF44vEKSYF6oprXhosEzZew/9jYd?=
 =?us-ascii?Q?yq15isAV0YrR9f5Tb1dtM4/Ll6QkbwzmVIjhQodfBjV2E+deuxah3kyDSt7V?=
 =?us-ascii?Q?YmXBpOU5adVa+6JsYuqA/OCY8zy4517ffftCcISiPX6MQ2WC87wD7KH2z+OP?=
 =?us-ascii?Q?Y9tvAZT3elfTmbOd5iuCEZ2ICPUgJvfoVBply/XGLt/MfQgVFl4ihP/E7vWA?=
 =?us-ascii?Q?EQboZTdSvUwF7/PawswsNAiCnf6iJbrF5D9USIKahK3SIgbrlNORMkQvMsoq?=
 =?us-ascii?Q?3cA3KVUFley5kTA+wLbj5HYPZVioD1fgg5HYIkOlAzwpp9idO5UneO5n+ACD?=
 =?us-ascii?Q?R5z5YdrYujTpaSfggcMBKoKj/XUf+8sxShSSFdiUNban7ExXQRQLGaaPHwRS?=
 =?us-ascii?Q?+Id8j7l4kw7zcoCJrMt4EIOg/EOeDZ3Xsa7Eyz8KidYL+NQGn3MBckIUcOiM?=
 =?us-ascii?Q?bWCSaFHeB3D+7Az1DimLXFwuhZ/ze5rohqnzxrfxd3+E32+vBg9+AZWDBUgM?=
 =?us-ascii?Q?rTSYCR53ZFPb6+r1INA+5cpgmKr8f6uHOvHAlT94PQzHsEs2or6ddvvIhQ3u?=
 =?us-ascii?Q?vGHjJ2jTc2py+y0KSPxQrmW/Yc6ejMSQwKfS5gq1xEjnafbHaGxYyqjhdnnS?=
 =?us-ascii?Q?EBlsw8Ve50oAWnHBwzMnlxVN+iRvRqMkBY7yENgsu9ZtVSUIdfGwj7n8ryd8?=
 =?us-ascii?Q?q8SVba1vcuXqLZkYvIRmC9Ibwaqqns4tDekvm4zwjZwxPGIfltNHBZ6XET0S?=
 =?us-ascii?Q?20dNOPKjBP/G5khdprgnkLVEhwGNWqWii5GNfW743iA8wqSKJ/NVVMxT0bxq?=
 =?us-ascii?Q?bZX/GM+MtlEWkeccsc+klSyiS+AfFs7qiby69giyu2bOYFf1DwN7eyEjQAbc?=
 =?us-ascii?Q?zBnJNLlPWMbxaRG884GrHLXBANcIBGdS+oee5FUsstgVL2MoB9ZFQgAKAFtX?=
 =?us-ascii?Q?S/FbyqJhKzGjYbbJUEBIOCaeguuEFepiBFzZ2hlvYYUud6Koiq3gTiKX1X+O?=
 =?us-ascii?Q?VwyziuFVq5bCpOfJbUxfgEWMUckJ7S94hvVs0/dcrR6iqpv0P0pnoU7YjXmu?=
 =?us-ascii?Q?l4PjybW/j4H47Jfbn5xy/siVZDoBWsWS8Wc7Z8b3FYIkWM+swopy8BjEo9z1?=
 =?us-ascii?Q?8pYRXFvv+flXxTR5bHnPjx97U4HFMJ4BIZqh6lX2zdr764w0sBH5cvm37Fk7?=
 =?us-ascii?Q?GS3tbjJ9aorsAXrUScTuG/GM079QVCN7zJEBvjG3RWoC1I9afOFJMMR68spu?=
 =?us-ascii?Q?N/DNc6Cae24sbBZ8W49KbF1XpyWfSx2sWW9hQhasTUmAI5jjjN0c7tafu03T?=
 =?us-ascii?Q?SJBuN1u1EnGabGjHAgi5lCcIugs2WIoSxDFNEyw4w6X3Ka7YkGoyLJimExNZ?=
 =?us-ascii?Q?PN1Eb597AB15874mbAyyVTEdE43FbDCGMRocPQYcWSCj7ZMcYvoiilFL57je?=
 =?us-ascii?Q?Q+sZd1GVtILJGEfdZH9DmNhds24awEmPpUKsJab5v35az/KZFGdbJZd9GLhb?=
 =?us-ascii?Q?aLNK5EDRLE7gq/3MdtwNqtnI1QwfBvDmVJD2I+ynkqnx3IpGQVbEh4AEbtJU?=
 =?us-ascii?Q?rGkPktYNR6oAtckx/2cbIt9LD2JCqK5CWmCCyNGjvORrLpSugsKs+yHWOMbh?=
 =?us-ascii?Q?JjV5gIWpizrSd22zOLGIA2KWX4uVmyTYLVPVIcy3xdFKauVX1Ipw6AiVt/2Q?=
 =?us-ascii?Q?29Jz5aOiQinBp0O40ZilFukZqjeFbd8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24855748-effa-4322-bc1e-08da4fdbf177
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 21:05:29.6121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLbVJ2YtEc3AfH5Ef+39eTX+FsfxeNKMJT+icbYwKClJuhyUXYphX2nNGBFPfZNlT28OR1JYy8dTIoKCQBxp/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6197
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-16_16:2022-06-16,2022-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206160084
X-Proofpoint-GUID: Hiy9ugxg1FCaekjr715ESZpCUD5DLwnY
X-Proofpoint-ORIG-GUID: Hiy9ugxg1FCaekjr715ESZpCUD5DLwnY
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Baolin Wang <baolin.wang@linux.alibaba.com>

The HugeTLB address ranges are linearly scanned during fork, unmap and
remap operations, and the linear scan can skip to the end of range mapped
by the page table page if hitting a non-present entry, which can help
to speed linear scanning of the HugeTLB address ranges.

So hugetlb_mask_last_page() is introduced to help to update the address in
the loop of HugeTLB linear scanning with getting the last huge page mapped
by the associated page table page[1], when a non-present entry is encountered.

Considering ARM64 specific cont-pte/pmd size HugeTLB, this patch implemented
an ARM64 specific hugetlb_mask_last_page() to help this case.

[1] https://lore.kernel.org/linux-mm/20220527225849.284839-1-mike.kravetz@oracle.com/

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 arch/arm64/mm/hugetlbpage.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index e2a5ec9fdc0d..ddeafee7c4de 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -368,6 +368,26 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 	return NULL;
 }
 
+unsigned long hugetlb_mask_last_page(struct hstate *h)
+{
+	unsigned long hp_size = huge_page_size(h);
+
+	switch (hp_size) {
+	case PUD_SIZE:
+		return PGDIR_SIZE - PUD_SIZE;
+	case CONT_PMD_SIZE:
+		return PUD_SIZE - CONT_PMD_SIZE;
+	case PMD_SIZE:
+		return PUD_SIZE - PMD_SIZE;
+	case CONT_PTE_SIZE:
+		return PMD_SIZE - CONT_PTE_SIZE;
+	default:
+		break;
+	}
+
+	return ~0UL;
+}
+
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 {
 	size_t pagesize = 1UL << shift;
-- 
2.35.3

