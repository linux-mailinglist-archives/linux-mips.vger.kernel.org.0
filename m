Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28BFC32AF63
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:26:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233878AbhCCATX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:19:23 -0500
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:64964 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1575520AbhCBD4f (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Mar 2021 22:56:35 -0500
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1223oArS013085;
        Mon, 1 Mar 2021 19:55:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=facebook; bh=BA40dj0KopFYCHvjipzySzT/qVxSaJBpqeFViv+pQ1Q=;
 b=T6dgV/VDU7w3THZ20AdRi+M2dMQVGdUDbVX3y9ZQOIBTMVDtRT8UsGg02LD5f0JWGa6+
 CaMrbE4OjPrmvVQQyrMewLIIJ5mJXjKU1Zo7RaUSIKaIN5Kyh4XM/I/1xiAYVoBMhiFq
 EdgEfszlSEx/2edE7vvbLfeM5jBNYwZdAUE= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 3706m7s7jr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 01 Mar 2021 19:55:29 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 1 Mar 2021 19:55:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WN47sT5buy30hQRjYZxxpFhurMr+P8KQEv6NyoslJ3fE8IRdCXMNHQ+9n6FtqE8eRO34CCH/fSijCIfx9Vg5CzaLKfvOEF2Grt4IdvdOSKSrxiFSvERVQcsc01nV7rpduwTp671Ud34N5pDqHGzLp7XQsqbFCfsNeNCFmisnvpysWG3Ss/glg1/PxvzrSjSsP4DWMMWRk2MWQgGd4gAnxu6A+fwewcH0/FOMAcsCaY9yuYTrkDcoayUXkMEOMUzSjOeCK8g4n4N86u6t1nUUfWBr0FyqGXaY367UGH4fnlzAP8rjP//W8S5BRoXlRwlBXye2l4YFvW9KnjSBrPpF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BA40dj0KopFYCHvjipzySzT/qVxSaJBpqeFViv+pQ1Q=;
 b=Ane34VQiUYqHfKitCpJuZ+AVjDiCse+3nb0vhlKkdllydt/auuLsDINfbpDi48VWOh/Q4N+WR5Ki1m8osgVp/7qtCSDCEuThuSk/VMxEn0FRl/9ga0dxDryXMmq0aHMNx/lX0VPM3jCMXm9hWNFH7xvvl20ULx74XSwdI7NO2yT2uwtmwsSSAOu8ftJaOItVWj43pugDx9LaiTnOS2KAnBzqTryyBJAQPyk0gZTLQfsEGCUi11J+qEEkNIx6rhoSSSnG2xRyg3CevsbGGFPldDBRon8YjSoUW8XBKq4B2+s6DREzKbhnOk1TGNlr2xqmXfSo0Hayt8xRm7k3tBmgDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fb.com;
Received: from BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
 by SJ0PR15MB4359.namprd15.prod.outlook.com (2603:10b6:a03:358::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 2 Mar
 2021 03:55:26 +0000
Received: from BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::53a:b2c3:8b03:12d1]) by BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::53a:b2c3:8b03:12d1%7]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 03:55:25 +0000
Date:   Mon, 1 Mar 2021 19:55:21 -0800
From:   Roman Gushchin <guro@fb.com>
To:     Mike Rapoport <rppt@kernel.org>
CC:     Florian Fainelli <f.fainelli@gmail.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        <linux-mm@kvack.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        <iamjoonsoo.kim@lge.com>, <riel@surriel.com>,
        Michal Hocko <mhocko@kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-team@fb.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] memblock: do not start bottom-up allocations with
 kernel_end
Message-ID: <YD23KbTlOzl60mqS@carbon.dhcp.thefacebook.com>
References: <20201217201214.3414100-1-guro@fb.com>
 <20201217201214.3414100-2-guro@fb.com>
 <23fc1ef9-7342-8bc2-d184-d898107c52b2@gmail.com>
 <20210228090041.GO1447004@kernel.org>
 <8cbafe95-0f8c-a9b7-2dc9-cded846622fd@gmail.com>
 <20210228230811.wdae7oaaf3mbpgwl@mobilestation>
 <2e973fa8-5f2b-6840-0874-9c15fa0ebea0@gmail.com>
 <YDy3xo3bMCqFtDhI@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YDy3xo3bMCqFtDhI@kernel.org>
X-Originating-IP: [2620:10d:c090:400::5:4d46]
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To BYAPR15MB4136.namprd15.prod.outlook.com
 (2603:10b6:a03:96::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from carbon.dhcp.thefacebook.com (2620:10d:c090:400::5:4d46) by SJ0PR03CA0221.namprd03.prod.outlook.com (2603:10b6:a03:39f::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Tue, 2 Mar 2021 03:55:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab4e6bca-791b-45d1-f61e-08d8dd2f02cb
X-MS-TrafficTypeDiagnostic: SJ0PR15MB4359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR15MB435947C3B05DB5207D8393EDBE999@SJ0PR15MB4359.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MwCZ7dGgXs/cg8uQkgy3zUNT7nc+hB7605XdWEc+ZFey1fNharSk7ZDF8IAHIxuNL9vr+YDXRPcQ7vbgxDmp/Pk+wDQnqZ0TXBmFqbt8N3NZxTQUzq9hwKDpsnsnj7tJS4QxQ++CXgPgx5SOhH4yQVSe7ESuRV3jDNXowOeQqsRh7htZ+XtQz5T73Y0IdtvWfOEHsTC5ANRp7OACFtFOFnMhgXmS+10tiySLMv8pHILU02R58OAlX2OjpzAmW3K2qDOSvWBPRljqapZU1wudBAuMJj7Oqi7Kwd8bX39TruzzPB/NQXypJ5/bLiaxTUzVa0LDYDrsojkwyuGYrtIQNbDGNfFJzgvlZgsfXE8OqocaSLvKUuwSq3BFt3jVpFPk3NtrhstdPBEiJg60mnj5aInUBoLryiEelYLUFAtNL9RYOu1WTrmPomUqTd+q3AdUY0+GcXhrt1l2fNMp8K35qJJXPOtn7kdUSknvFEnuNpWdv4eaGZvA+jNSzNilPtUqhnH1cejUBPaA7gsjQTU42g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR15MB4136.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(376002)(366004)(346002)(136003)(478600001)(30864003)(4326008)(54906003)(186003)(16526019)(86362001)(8676002)(66946007)(8936002)(83380400001)(9686003)(6666004)(53546011)(6916009)(6506007)(5660300002)(52116002)(55016002)(2906002)(66476007)(7696005)(66556008)(316002)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Hi/iZ6priLxfNPZRoN8GXIOlDznmADOu6nx/GzLn91qGhvV6607JJnzo+9CR?=
 =?us-ascii?Q?+zl0LVxoYebyjqyen5BYHJs0XpV19qdpMZ12aHQIjofmuM6NdruXlpe03JJe?=
 =?us-ascii?Q?zzfUFTGU5ZqKCQbMkCJ+UU01jT9YDUtey0qS3kTQwG7Xb2GTWL4Ag2x0upQz?=
 =?us-ascii?Q?ptVRuu8g8qwW2HcYHUrhJlPK7zpAcri2XRHClb8EJEqyHsK5the3d5lUB7aQ?=
 =?us-ascii?Q?/yaYnRzHh0E1MRoydIVdYJ8QgTgh2QqN/k4JgjdFaFBbSFY6IXYWQuZSoplt?=
 =?us-ascii?Q?4C76he5gxiD0znXDSsnkDEHjpWj3wC5Y9E8wQXXToMBJI7B+bLsefJpyvmxA?=
 =?us-ascii?Q?DUxGPViVGO4q11xkRM7nrutBhQjwkltDKr85iXeqopvDkKzN1XdkjK2XhesT?=
 =?us-ascii?Q?gr9caQa9azCbWZS6RvB/6h62EGxAsHimbNSBT7L64KPkYwrWdD2Zaenf1VMb?=
 =?us-ascii?Q?ukJljKCSW4cxJ9Kdk/U+E8+NflnKWkUlePhCSqRhryrXH6hPLz9Nb8KGjWqn?=
 =?us-ascii?Q?FwU/w4oaAbxHncsyB/qXxZEnPeMHCBTIvvuCM1VjgvfrnPNEd3qnxXYxEJ13?=
 =?us-ascii?Q?m34seQgiso0H0QrWy2rJbYoY2l0dPUrWlkcsBnmawLxw73prMwTG0nnT82ja?=
 =?us-ascii?Q?h15qSSsSnMx8VlpRl1Ia7EqDdL+lVUyMbqJfBvqWwz18oODJOiRHdZWSQore?=
 =?us-ascii?Q?arYV479jZ4e9UjsO7mdQodDSb/YNDfw3JzB+HXxMd5Ifylrd4ckVyavzohuJ?=
 =?us-ascii?Q?F5vggAPZPXDGx61Ip5b8EF12mS54+g+AS4Tw0DZxZn1bCpaeTgkGtc8k/2eh?=
 =?us-ascii?Q?dovei2K5zbkqzC6okHI+7aGJvnAB+oZb+/HP/oHjQmZ8uZwb/5XYydZVfi0o?=
 =?us-ascii?Q?KWltczX6qcBC8nrpG98df13cQdULt7dU8kv9wWDZ2gIQqbjJX2jMAQ8Imrt2?=
 =?us-ascii?Q?cQDgJBAe5n7fQUdmrp84brIPl04mVLxgKreP+FTNxz/T009N/O7H/SK+UZND?=
 =?us-ascii?Q?oO98/YNwJ/9TM4BDQ4BNBHEh8rymoislUdjYZhBE792pTTC5/wCNrpXbDf2s?=
 =?us-ascii?Q?3YNQcgFPD+SpFY+XQYv7o0QuHoyPH+LA3vJ8MCdBYYM3Uz5u7iFVHLR5hNF/?=
 =?us-ascii?Q?MEwOA7T67Kj4GuR3YMlDuSVquyBqPMH0ftNi9a+3R5muBLUXdUKdatJLk/ly?=
 =?us-ascii?Q?DsIYNc0cLI968Ihs65EjI2CPolaBwSkiPDZFoIIfNua78hGYOeJzCRyjWLXn?=
 =?us-ascii?Q?yEPo+XjoLCViKS6F1bHEJZeYE2hzV/4xs0qvfxN6vUiFdDMyscRaQi/h1GUD?=
 =?us-ascii?Q?hQ8psFiAfnPnGSYzx6KIi9+3GwqNLb8/AVOREamQym9uHA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4e6bca-791b-45d1-f61e-08d8dd2f02cb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB4136.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 03:55:25.8294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2F8q3NfJwofpA7w52HWDXX2M3FigCk2LLd6uepttsFNICIr5ywDj73eJipXvN58
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4359
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-01_15:2021-03-01,2021-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 clxscore=1011
 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103020027
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 01, 2021 at 11:45:42AM +0200, Mike Rapoport wrote:
> On Sun, Feb 28, 2021 at 07:50:45PM -0800, Florian Fainelli wrote:
> > Hi Serge,
> > 
> > On 2/28/2021 3:08 PM, Serge Semin wrote:
> > > Hi folks,
> > > What you've got here seems a more complicated problem than it
> > > could originally look like. Please, see my comments below.
> > > 
> > > (Note I've discarded some of the email logs, which of no interest
> > > to the discovered problem. Please also note that I haven't got any
> > > Broadcom hardware to test out a solution suggested below.)
> > > 
> > > On Sun, Feb 28, 2021 at 10:19:51AM -0800, Florian Fainelli wrote:
> > >> Hi Mike,
> > >>
> > >> On 2/28/2021 1:00 AM, Mike Rapoport wrote:
> > >>> Hi Florian,
> > >>>
> > >>> On Sat, Feb 27, 2021 at 08:18:47PM -0800, Florian Fainelli wrote:
> > >>>>
> > > 
> > >>>> [...]
> > > 
> > >>>>
> > >>>> Hi Roman, Thomas and other linux-mips folks,
> > >>>>
> > >>>> Kamal and myself have been unable to boot v5.11 on MIPS since this
> > >>>> commit, reverting it makes our MIPS platforms boot successfully. We do
> > >>>> not see a warning like this one in the commit message, instead what
> > >>>> happens appear to be a corrupted Device Tree which prevents the parsing
> > >>>> of the "rdb" node and leading to the interrupt controllers not being
> > >>>> registered, and the system eventually not booting.
> > >>>>
> > >>>> The Device Tree is built-into the kernel image and resides at
> > >>>> arch/mips/boot/dts/brcm/bcm97435svmb.dts.
> > >>>>
> > >>>> Do you have any idea what could be wrong with MIPS specifically here?
> > > 
> > > Most likely the problem you've discovered has been there for quite
> > > some time. The patch you are referring to just caused it to be
> > > triggered by extending the early allocation range. See before that
> > > patch was accepted the early memory allocations had been performed
> > > in the range:
> > > [kernel_end, RAM_END].
> > > The patch changed that, so the early allocations are done within
> > > [RAM_START + PAGE_SIZE, RAM_END].
> > > 
> > > In normal situations it's safe to do that as long as all the critical
> > > memory regions (including the memory residing a space below the
> > > kernel) have been reserved. But as soon as a memory with some critical
> > > structures haven't been reserved, the kernel may allocate it to be used
> > > for instance for early initializations with obviously unpredictable but
> > > most of the times unpleasant consequences.
> > > 
> > >>>
> > >>> Apparently there is a memblock allocation in one of the functions called
> > >>> from arch_mem_init() between plat_mem_setup() and
> > >>> early_init_fdt_reserve_self().
> > > 
> > > Mike, alas according to the log provided by Florian that's not the reason
> > > of the problem. Please, see my considerations below.
> > > 
> > >> [...]
> > >>
> > >> [    0.000000] Linux version 5.11.0-g5695e5161974 (florian@localhost)
> > >> (mipsel-linux-gcc (GCC) 8.3.0, GNU ld (GNU Binutils) 2.32) #84 SMP Sun
> > >> Feb 28 10:01:50 PST 2021
> > >> [    0.000000] CPU0 revision is: 00025b00 (Broadcom BMIPS5200)
> > >> [    0.000000] FPU revision is: 00130001
> > > 
> > >> [    0.000000] memblock_add: [0x00000000-0x0fffffff]
> > >> early_init_dt_scan_memory+0x160/0x1e0
> > >> [    0.000000] memblock_add: [0x20000000-0x4fffffff]
> > >> early_init_dt_scan_memory+0x160/0x1e0
> > >> [    0.000000] memblock_add: [0x90000000-0xcfffffff]
> > >> early_init_dt_scan_memory+0x160/0x1e0
> > > 
> > > Here the memory has been added to the memblock allocator.
> > > 
> > >> [    0.000000] MIPS: machine is Broadcom BCM97435SVMB
> > >> [    0.000000] earlycon: ns16550a0 at MMIO32 0x10406b00 (options '')
> > >> [    0.000000] printk: bootconsole [ns16550a0] enabled
> > > 
> > >> [    0.000000] memblock_reserve: [0x00aa7600-0x00aaa0a0]
> > >> setup_arch+0x128/0x69c
> > > 
> > > Here the fdt memory has been reserved. (Note it's built into the
> > > kernel.)
> > > 
> > >> [    0.000000] memblock_reserve: [0x00010000-0x018313cf]
> > >> setup_arch+0x1f8/0x69c
> > > 
> > > Here the kernel itself together with built-in dtb have been reserved.
> > > So far so good.
> > > 
> > >> [    0.000000] Initrd not found or empty - disabling initrd
> > > 
> > >> [    0.000000] memblock_alloc_try_nid: 10913 bytes align=0x40 nid=-1
> > >> from=0x00000000 max_addr=0x00000000
> > >> early_init_dt_alloc_memory_arch+0x40/0x84
> > >> [    0.000000] memblock_reserve: [0x00001000-0x00003aa0]
> > >> memblock_alloc_range_nid+0xf8/0x198
> > >> [    0.000000] memblock_alloc_try_nid: 32680 bytes align=0x4 nid=-1
> > >> from=0x00000000 max_addr=0x00000000
> > >> early_init_dt_alloc_memory_arch+0x40/0x84
> > >> [    0.000000] memblock_reserve: [0x00003aa4-0x0000ba4b]
> > >> memblock_alloc_range_nid+0xf8/0x198
> > > 
> > > The log above most likely belongs to the call-chain:
> > > setup_arch()
> > > +-> arch_mem_init()
> > >     +-> device_tree_init() - BMIPS specific method
> > >         +-> unflatten_and_copy_device_tree()
> > > 
> > > So to speak here we've copied the fdt from the original space
> > > [0x00aa7600-0x00aaa0a0] into [0x00001000-0x00003aa0] and unflattened
> > > it to [0x00003aa4-0x0000ba4b].
> > > 
> > > The problem is that a bit later the next call-chain is performed:
> > > setup_arch()
> > > +-> plat_smp_setup()
> > >     +-> mp_ops->smp_setup(); - registered by prom_init()->register_bmips_smp_ops();
> > >         +-> if (!board_ebase_setup)
> > >                  board_ebase_setup = &bmips_ebase_setup;
> > > 
> > > So at the moment of the CPU traps initialization the bmips_ebase_setup()
> > > method is called. What trap_init() does isn't compatible with the
> > > allocation performed by the unflatten_and_copy_device_tree() method.
> > > See the next comment.
> > > 
> > >> [    0.000000] memblock_alloc_try_nid: 25 bytes align=0x4 nid=-1
> > >> from=0x00000000 max_addr=0x00000000
> > >> early_init_dt_alloc_memory_arch+0x40/0x84
> 
> ...
> 
> > >> [    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536
> > >> bytes, linear)
> > > 
> > >> [    0.000000] memblock_reserve: [0x00000000-0x000003ff]
> > >> trap_init+0x70/0x4e8
> > > 
> > > Most likely someplace here the corruption has happened. The log above
> > > has just reserved a memory for NMI/reset vectors:
> > > arch/mips/kernel/traps.c: trap_init(void): Line 2373.
> > > 
> > > But then the board_ebase_setup() pointer is dereferenced and called,
> > > which has been initialized with bmips_ebase_setup() earlier and which
> > > overwrites the ebase variable with: 0x80001000 as this is
> > > CPU_BMIPS5000 CPU. So any further calls of the functions like
> > > set_handler()/set_except_vector()/set_vi_srs_handler()/etc may cause a
> > > corruption of the memory above 0x80001000, which as we have discovered
> > > belongs to fdt and unflattened device tree.
> > > 
> > >> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> > >> [    0.000000] Memory: 2045268K/2097152K available (8226K kernel code,
> > >> 1070K rwdata, 1336K rodata, 13808K init, 260K bss, 51884K reserved, 0K
> > >> cma-reserved, 1835008K highmem)
> > >> [    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
> > >> [    0.000000] rcu: Hierarchical RCU implementation.
> > >> [    0.000000] rcu:     RCU event tracing is enabled.
> > >> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
> > >> is 25 jiffies.
> > >> [    0.000000] NR_IRQS: 256
> > > 
> > >> [    0.000000] OF: Bad cell count for /rdb
> > >> [    0.000000] irq_bcm7038_l1: failed to remap intc L1 registers
> > >> [    0.000000] OF: of_irq_init: children remain, but no parents
> > > 
> > > So here is the first time we have got the consequence of the corruption
> > > popped up. Luckily it's just the "Bad cells count" error. We could have
> > > got much less obvious log here up to getting a crash at some place
> > > further...
> > > 
> > >> [    0.000000] random: get_random_bytes called from
> > >> start_kernel+0x444/0x654 with crng_init=0
> > >> [    0.000000] sched_clock: 32 bits at 250 Hz, resolution 4000000ns,
> > >> wraps every 8589934590000000ns
> > > 
> > >>
> > >> and with your patch applied which unfortunately did not work we have the
> > >> following:
> > >>
> > >> [...]
> > > 
> > > So a patch like this shall workaround the corruption:
> > > 
> > > --- a/arch/mips/bmips/setup.c
> > > +++ b/arch/mips/bmips/setup.c
> > > @@ -174,6 +174,8 @@ void __init plat_mem_setup(void)
> > >  
> > >  	__dt_setup_arch(dtb);
> > >  
> > > +	memblock_reserve(0x0, 0x1000 + 0x100*64);
> > > +
> > >  	for (q = bmips_quirk_list; q->quirk_fn; q++) {
> > >  		if (of_flat_dt_is_compatible(of_get_flat_dt_root(),
> > >  					     q->compatible)) {
> > 
> > This patch works, thanks a lot for the troubleshooting and analysis! How
> > about the following which would be more generic and works as well and
> > should be more universal since it does not require each architecture to
> > provide an appropriate call to memblock_reserve():
> > 
> > diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> > index e0352958e2f7..b0a173b500e8 100644
> > --- a/arch/mips/kernel/traps.c
> > +++ b/arch/mips/kernel/traps.c
> > @@ -2367,10 +2367,7 @@ void __init trap_init(void)
> > 
> >         if (!cpu_has_mips_r2_r6) {
> >                 ebase = CAC_BASE;
> > -               ebase_pa = virt_to_phys((void *)ebase);
> >                 vec_size = 0x400;
> > -
> > -               memblock_reserve(ebase_pa, vec_size);
> >         } else {
> >                 if (cpu_has_veic || cpu_has_vint)
> >                         vec_size = 0x200 + VECTORSPACING*64;
> > @@ -2410,6 +2407,14 @@ void __init trap_init(void)
> > 
> >         if (board_ebase_setup)
> >                 board_ebase_setup();
> > +
> > +       /* board_ebase_setup() can change the exception base address
> > +        * reserve it now after changes were made.
> > +        */
> > +       if (!cpu_has_mips_r2_r6) {
> > +               ebase_pa = virt_to_phys((void *)ebase);
> > +               memblock_reserve(ebase_pa, vec_size);
> > +       }

Hi folks!

First, I'm really sorry for breaking things and also being silent for last
couple of days: I was almost completely offline. Thank you for working on
this!

> 
> With this it's still possible to have memblock allocations around ebase_pa
> before it is reserved.
> 
> I think we have two options here to solve it in more or less generic way:
> 
> * split the reservation of ebase from traps_init() and move it earlier to
> setup_arch(). I didn't check what board_ebase_setup() do, if they need to
> allocate memory it would not work.

It seems that it doesn't allocate any memory, so it sounds like a good option.
But doesn't the ebase initialization depend on the memblock allocator?

I see in trap_init():
    if (!cpu_has_mips_r2_r6) {
        ...
    } else {
        ...
	ebase_pa = memblock_phys_alloc(vec_size, 1 << fls(vec_size));
	...
	if (!IS_ENABLED(CONFIG_EVA) && !WARN_ON(ebase_pa >= 0x20000000))
	    ebase = CKSEG0ADDR(ebase_pa);
        else
            ebase = (unsigned long)phys_to_virt(ebase_pa);


> 
> * add an API to memblock to set lower limit for allocations and then set
> the lower limit, to e.g. kernel load address in arch_mem_init(). This may
> add complexity for configurations with relocatable kernel and kaslr.

This option looks more like a workaround to me, but maybe it's ok too.

Thanks!
