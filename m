Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43C6542ECBF
	for <lists+linux-mips@lfdr.de>; Fri, 15 Oct 2021 10:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234238AbhJOIu3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Oct 2021 04:50:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18848 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233729AbhJOIu2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Oct 2021 04:50:28 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19F85YJm017156;
        Fri, 15 Oct 2021 08:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=yEJbO/xkeXLKoKMKl1GtjWjglwVOuvJTP6p7uvy92bI=;
 b=T13XuGXEE3cRkfA+6NMiL2qc+7MGgPjagQUL/dSAPxkih9TgMZyeFOX0Il5Q8j8HuH/r
 9a3BBMxgm4azf1lMhms/Ti2tbjn7FrleKIfm4I13UE/OrKMVwJHBuQBNI6WvMMlghNa4
 Ub8hmRRVe8McEgtf6L9FWYt/AIVTqBMzzcc5vT1+7mkg2jaYP36hnFeLo/00tu56PVTJ
 XyFjOxjcXyLgCXe4M/O+BXBCsurOuQMeXMoGpGMNEJ6K68SCHk3PtGkPTl5G9mA8hk/4
 ntLlFL1nZEYhMlCrrSWX3Y57gzjkHltmWSB92exW/d0Ker/2u/R6DQ5MfQYAJiQfFo2z /A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bph1bxnhp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 15 Oct 2021 08:48:03 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19F8jHtS147318;
        Fri, 15 Oct 2021 08:48:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
        by userp3030.oracle.com with ESMTP id 3bkyve516x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 15 Oct 2021 08:48:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nd3UfzQy/eH43yGTLljg0R53JyAMgCuyxpE1kNAbNkNbT24GlXxMtP52LoZqig30xBBrHoUsjjTfV4wK/+0t7Zb1EQX0fO4EX5l98lcuXvSvH4AlC4i+30dlJjQdhbx3TP0YuqA5dpyuGoMeD7JtLlh4JKXY3UYWVuNv0x6LWKvkGzu0OBR9GPavRuNSc0LBAPhDhWzSDBECkNj7uQ6FzzAERQUPz65XZhadFSsPeiPjij+MkQY/ZrTGut0tROpT1N7K3PfqX2X4XR7TUd/Po9/p/I/OHbsAV+ogj+xKqaK595Vp5aS1bSpQngGL6CeQt+Kb56DeMFmoSiA+MaRaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEJbO/xkeXLKoKMKl1GtjWjglwVOuvJTP6p7uvy92bI=;
 b=iDULpdWV8J5noKKf++PmtCQ5d4GqCZOZdbG6k7b/oV0Np0VEVPte7A9/LJe8Ujbq8g/4hLAFaugKpWLyzmA5dUuepAFkOaOg1lWl4QLSUrG01XPuw0t5ZYjMoH+PRL8Nw7tvxZRxg1NpcxL82vVJvma5dr4sDfICmp5UeuEVrD4gpKBgqcqbqU+rTAFmJAzbBh9KlukDjl/7/ki9NP+Ng+dDsA8nseQTgl1jcnGrlkJyFEkWvIt+UviKr6DaNoqTNGj4YexEQsEol+8Jga56g6dWcckBO/CmP3MoKo0JOfJscTFUMOat4UlIA5VF+nwCczVlgV6Q+yQdOqj6R7iIVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEJbO/xkeXLKoKMKl1GtjWjglwVOuvJTP6p7uvy92bI=;
 b=vryp7zHDvQdcR5CJNfkn+xJ97MiBQEOywZNJf9w8sk1ThWWM5b7f+JKqv0wmnPBiJmQviXGm7nVe7kan9vdepgkbYU4Mki/vubEhP8IWZWDOBl6yfOTBSSWDRrQToM+igVNsfmeYmNibBDJ5Qe1cexzygkqgxudcBkT5TUp+TAM=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4433.namprd10.prod.outlook.com
 (2603:10b6:303:6e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 08:47:59 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4608.016; Fri, 15 Oct 2021
 08:47:59 +0000
Date:   Fri, 15 Oct 2021 11:47:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Geert Uytterhoeven <geert@linux-m68k.org>,
        Miguel Ojeda <ojeda@kernel.org>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v7 18/21] auxdisplay: ht16k33: Add support for segment
 displays
Message-ID: <202110150246.UAF2lniv-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012183327.649865-19-geert@linux-m68k.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JN2P275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend Transport; Fri, 15 Oct 2021 08:47:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3601dd5-14c1-443c-c43a-08d98fb87cee
X-MS-TrafficTypeDiagnostic: CO1PR10MB4433:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4433DC1F5B05C4FB70C9A3768EB99@CO1PR10MB4433.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nt2RRjFsBx2KXyUqfwDuPqH5hG4YFHK7WyHlIRfqpEJ0tjkmhHGWYm8HCmnuSLx0DgaoWOvuBROGVBd9sad+mJI2NA4LOLSjhqRFQzAFgVsGFjMBFA6cnV4aOHQ8x2t53IoC/OWxGcxd3Ss4C4YLlBYtxfPECJr2+aQ67uEjmH8L54o1VneZ4Gg8QAb1as6UdtvlKj3eBgq4Fsb9RcFr4K/MKmd8eefibuCplSqOP/O8G0gQTFwsx8CCKwRN0H4X7Dl0gQOrZieXNxRKmeGe1mjhsA+lviu3e2Ab7cvM+ZHeLpDIWklNKHl4zV8A4NVlRni7yYysBktPluKb7CQhDHAnzF8nERWjPXVPzIjzhgyhqUYqHv+jVKL/IPA9u9Iah+RSgqqeN6xaSkYhm4cD96dqs5U7iOG9hL6lMRJwToLb7wpz7uZothpJw85ajLQr8YGvQM0qe0HyaC8ggT8Jzc/ADuI+H11JT2MpJ+ZHtxqqf2di8hH07tDEVZ3UdOKzW0DLdtCHj3RWjjzenvKIWSBjFaSKRsflbkPUCyfdW8ok5NnELkQ1UvR5oVZd1rG5txTzIAociG5j3K3rFNpsvHoht6wBxkmCYrRtZc+wcqx3NYKqmsOC37UgwiqkQ2Ls5dL2qCMiRAa/Ft/H9aSX3P+lK9g+8by/sdHUt0wtJu12++jMmPC6T9AAr9PlpV8bmVkExYfmGmmu/XRpySRYmwkkMA+0nvVnaMN7yg+kr4+GA/ZzwLVvdXlBw48JBrRiI7jid3plbEKvoQhWzaA0Rd6zFRZ9NasgL7+F2Ix9UhBITGoVvq3jxyNSMfIv3O7tJQwVdlyO4rJLQyZZDiVV0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(1076003)(8936002)(6496006)(9686003)(316002)(86362001)(38100700002)(2906002)(6486002)(44832011)(26005)(52116002)(36756003)(186003)(38350700002)(66556008)(66476007)(6666004)(66946007)(956004)(8676002)(5660300002)(83380400001)(4001150100001)(4326008)(7416002)(508600001)(966005)(54906003)(110136005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g9GFJHBa6VVktQjizkzudBNj3z2u/Ldp0QtG9D5nIb0eAN/v5FSkaMmZ1/PR?=
 =?us-ascii?Q?jlggAnLTXW7lKvCzjnCRQCCsGyEGRRVD6VM8yHWC9muaDd0UBa40O31G0E9/?=
 =?us-ascii?Q?BIA9ZLbOMA+B0C9YMWinoSq/tKBzrq1/XMfz6I8swYHA7AU023Hp9yjA8DiU?=
 =?us-ascii?Q?kKsyG7PIx0lxfP565ZfOkndF1Xa4028d3sUnckJ6fjXen2N7HlTUVZ30/TSz?=
 =?us-ascii?Q?L5X58T+Zd//Zjnmih/uhO1CRDnP/UPWqoyLJQ9Pd9tt6O1CzWQ1ezp1FmAiy?=
 =?us-ascii?Q?qOhnm6Ltj7b0f4wiCIYkTF+EBmXMLfcag4UQrrZyISfnm8cJoCTK3Fu7rUmJ?=
 =?us-ascii?Q?M12/Sb41Ehvtu+FwMiuw5ojbb43ZOe/jzunvjZRf4mNBjT5bdRf0aG9bNv15?=
 =?us-ascii?Q?YNiTPC39dvfLjSvcaU5UF6EG5bnfyGEgCi51vw0LtMppjhXlxffuy/kKq5Wr?=
 =?us-ascii?Q?nu+VsTlrgRYvqtyh4ehnvK/KkuyqYbfizOYD07iSdSq8Fav0JHvk1K5lpLI2?=
 =?us-ascii?Q?xEuUjSMc4cD1zFRhbRg7XzYX+ZWSZcoMqeEIiKtVKlck/C4EB58GTxaJ9+E6?=
 =?us-ascii?Q?N97gBGPp7BFwALxKUW7prlYK5jCzpgX5jhwAcHqx75yXXi5T+nuBTqpxzI/S?=
 =?us-ascii?Q?+U8KJa4TtsJYTGaG4ujTnPF2VMjgC1JmOM+BfEJO8vDtRh68WWqFuzRtNgMO?=
 =?us-ascii?Q?LNzGkrMnBw8I91J7qmXTxZRs5fnhABlOHts2d4np6JDk8qfI6QWHYk3H5k8j?=
 =?us-ascii?Q?rhbPJ13QuaaHNU+U7QsKJcRNMlImVIZh6KK4sjVzGLGhYwZYU4H3TAVWaNim?=
 =?us-ascii?Q?tPASgvBGFmlkyFuJk+wtxbrZkkFDOZHQQZ+LnTmVM2H68Z6DZY/d3lyL2b1c?=
 =?us-ascii?Q?LnnlKI2MsSmzEd6+u6jVHLCQqbkN28aRmMQNWQY8mcmOvOGGZp66I0FN12wk?=
 =?us-ascii?Q?YARcrLOcnbZ9flfJgFpvoDHVA/SuGPIwUSmfCIl+bV3m3i3ILyUT2ricpXfI?=
 =?us-ascii?Q?MQcGvgr9GngibDw/GkijkGJ8udC9C86O2q9SSHKtwuZ68LEkbwKayUtiiOH8?=
 =?us-ascii?Q?wmEX4XLnNxQ/aNIK7kIbEqOLMb/FPAkXjyu8U2vOZpLNRfobXJdRcEZffBf1?=
 =?us-ascii?Q?IxyFWq/5E4RtUQ2QRHtNjPV15hckv5SzBp0UgEdz4+HxkFBxPa/RzThrQTIL?=
 =?us-ascii?Q?b1l6u8PbyQDbpkPxqjacdc4HG4tJoPuW5w4t92s+N1+SwwJSRqvx8NCvKW21?=
 =?us-ascii?Q?5PgJrp4MbKhK9aaF4bB2SbOihUrwBtnm97buhfuNqzsPTqJFWHxgqNJYzNQr?=
 =?us-ascii?Q?0kTaw6Jrf+3qPLLUxdSiN+oM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3601dd5-14c1-443c-c43a-08d98fb87cee
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:47:58.9238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXP/45r8SMao+5CCComaKqcQj0TEMmAF6LIDyRspFLgrBhEDO3siDZtfmfw0FjlIzxq9phcAZsFMYPqHj8m4D/2qE3i4wcJ8ie+ADaji/no=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4433
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10137 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110150055
X-Proofpoint-ORIG-GUID: teo-WdHw5gZ478s2VojDfdT_oFhDuDUS
X-Proofpoint-GUID: teo-WdHw5gZ478s2VojDfdT_oFhDuDUS
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Geert,

url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/auxdisplay-ht16k33-Add-character-display-support/20211013-025705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: i386-randconfig-m031-20211012 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
include/uapi/linux/map_to_14segment.h:87 map_to_seg14() error: buffer overflow 'map->table' 128 <= 255
include/uapi/linux/map_to_14segment.h:87 map_to_seg14() error: buffer overflow 'map->table' 128 <= 255
include/uapi/linux/map_to_14segment.h:87 map_to_seg14() error: buffer overflow 'map->table' 128 <= 255

vim +87 include/uapi/linux/map_to_14segment.h

d26423994040a7 Geert Uytterhoeven 2021-10-12  85  static __inline__ int map_to_seg14(struct seg14_conversion_map *map, int c)
d26423994040a7 Geert Uytterhoeven 2021-10-12  86  {
d26423994040a7 Geert Uytterhoeven 2021-10-12 @87  	return c >= 0 && c < sizeof(map->table) ? __be16_to_cpu(map->table[c])
                                                                         ^^^^^^^^^^^^^^^^^^^^^^
This needs to be c < ARRAY_SIZE(map->table) instead of sizeof().

d26423994040a7 Geert Uytterhoeven 2021-10-12  88  						: -EINVAL;
d26423994040a7 Geert Uytterhoeven 2021-10-12  89  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

