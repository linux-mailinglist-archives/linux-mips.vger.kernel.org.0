Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34CF039E766
	for <lists+linux-mips@lfdr.de>; Mon,  7 Jun 2021 21:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhFGTZP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Jun 2021 15:25:15 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41342 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230468AbhFGTZO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Jun 2021 15:25:14 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157JDonj018086;
        Mon, 7 Jun 2021 19:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=nmenEWTgpyKiOWioSPZ06TcRXcOpzdhbEP0JaULnm5s=;
 b=rqXZMKl4WGFjRgL/HGti6XYu22v599MsFH6jrhm12PEZcbcLDhQc644MDDAvubRq6lzl
 pdmWLPpj32tDF4Lu0Qu3YcAruf5YIlDr/xOYirWVCrj23H/oxK8jRf23XTiMD5YCRAzB
 nWJ9LQN+0LtqGjE+rSX2PjRgFYB8aaCYpwQnDyDBHxQ2zNjb6owNtAR5bUZjJptWqQ4P
 DGNYtYmygMwbQaO3WWATM+JAGWlalauYPvBOy9S1niL41nSGfW1K/YJTtdl19MljXoyI
 EpTf1LR+CLERSQhsc1JN0RwuZVMAE52uq7KKWFUUUmt0o6w9+GXKNJQm9nPFKfny/H6G ug== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 391fyr06vk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 19:23:00 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157JGWvj089024;
        Mon, 7 Jun 2021 19:22:59 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        by userp3020.oracle.com with ESMTP id 390k1qbxkb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 19:22:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJmz/pxH9j3VeqhTTObZZJUVdDkelOg7ohu9ZxFsEhTjrw5sRbGIM6aFt2Yh6+p4wuHKqQPu7oP2szGvVHhN9IwvKDa5aGGM4ubIxykESwUE4hrD8LtG85d7Bbc9luMvXF/u42mjFVKTxJQezwoiEIzr1/ID7rsD+GFbJK68eNz/20ZY/mBytx3NDueAvk7MwsULRzEhjT2BBU+xG7hJOKExQUfkjH/SSq1D4hCiYDtqPDNPdbnEVIUhBnv/picBt0IBpyZNxv7Ehit1TZ2hLvl42IbywyrjgW+kT87ZZwexJg1T+Ec4Jis0YD/vhiWpuJmwWJQMDXnXfVWvCLmHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmenEWTgpyKiOWioSPZ06TcRXcOpzdhbEP0JaULnm5s=;
 b=bWKoUXHiWXdQ+2fupQvvkYgLqc29LxLvk8O/NKWUt1EgkWWjQsc0aOPRNpTnf8MUQ1iyEcQGQOr+Es3u/FBaDmzCGLDMwXxneGyzHzzTEj8FOpNt00nC4vtfVJMfkIyDLrWIOeIdAdLnz5AatwFfNR3yQkRDjXhKsGu4c2jwPUC0Oc1TKG2gz53St0yDujcFWQt1QK/WOdvwib1+hHajHEmKqfuCGfbNBqKQWX72AiLs07DfpG/9vVjIx0TUB54jWVqrbUHP/61zVW2p5XtiCQyefcezEtBr8O77yCGyzwFoWWHyDbd+wCSxqux4xqqNj6IfONDr4ebMA+rC8cv4/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmenEWTgpyKiOWioSPZ06TcRXcOpzdhbEP0JaULnm5s=;
 b=n7ivW0V6yNbtcVgKsdh9jUXarnBdewrZ7O/HLgv6EAvhtg5rtLx1LaueP1Ey+4ckeN8dPD3zIetwtLB8ehNv9JYolpVulI2xKF3m7Owq85fUJthfuQK0Wusu1OoUAoCytSFLLVxd/jm0OrCCJoLYoCixy7HLyXYhI5acsRZfMgk=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=oracle.com;
Received: from SN6PR10MB3021.namprd10.prod.outlook.com (2603:10b6:805:cc::19)
 by SN6PR10MB3455.namprd10.prod.outlook.com (2603:10b6:805:cd::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 19:22:55 +0000
Received: from SN6PR10MB3021.namprd10.prod.outlook.com
 ([fe80::f17c:44eb:d1be:2107]) by SN6PR10MB3021.namprd10.prod.outlook.com
 ([fe80::f17c:44eb:d1be:2107%7]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 19:22:55 +0000
Subject: Re: [PATCH v7 2/4] KVM: stats: Add fd-based API to read binary stats
 data
To:     Jing Zhang <jingzhangos@google.com>, KVM <kvm@vger.kernel.org>,
        KVMARM <kvmarm@lists.cs.columbia.edu>,
        LinuxMIPS <linux-mips@vger.kernel.org>,
        KVMPPC <kvm-ppc@vger.kernel.org>,
        LinuxS390 <linux-s390@vger.kernel.org>,
        Linuxkselftest <linux-kselftest@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Jim Mattson <jmattson@google.com>,
        Peter Shier <pshier@google.com>,
        Oliver Upton <oupton@google.com>,
        David Rientjes <rientjes@google.com>,
        Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        David Matlack <dmatlack@google.com>,
        Ricardo Koller <ricarkol@google.com>
References: <20210603211426.790093-1-jingzhangos@google.com>
 <20210603211426.790093-3-jingzhangos@google.com>
From:   Krish Sadhukhan <krish.sadhukhan@oracle.com>
Message-ID: <4b4b090b-0f17-a744-fe66-33c21baf6f40@oracle.com>
Date:   Mon, 7 Jun 2021 12:22:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210603211426.790093-3-jingzhangos@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2606:b400:8301:1010::16aa]
X-ClientProxiedBy: SN6PR16CA0050.namprd16.prod.outlook.com
 (2603:10b6:805:ca::27) To SN6PR10MB3021.namprd10.prod.outlook.com
 (2603:10b6:805:cc::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2606:b400:8301:1010::16aa) by SN6PR16CA0050.namprd16.prod.outlook.com (2603:10b6:805:ca::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 19:22:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9656f742-b41f-41cc-3612-08d929e9a6c2
X-MS-TrafficTypeDiagnostic: SN6PR10MB3455:
X-Microsoft-Antispam-PRVS: <SN6PR10MB3455FA60C230BB26C840D32781389@SN6PR10MB3455.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:26;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: agP42ZNJMs2c7qKMMO3jcBSVJXG120Bm9eCzQIfAneq4cgMoeRw1TdAExmcWlRcWBZP4vVJ1Oy4WzEyxx2VwsqqIdIZoYqtwRZDDzc2AU+0ffnf2PHn8KSRTSSy2eOCkHMTxNn8uw3RZAfLO9TWHGAFrN0K/H9fQhqdSK83Ru68KHFqifYq4BfvViKqCL9+OaS3K3ZR0A69LWaM+0o/YKKoWYvPw21Kj4RyxefMA5ULdl2hIEg2lxpN/Jc6DRDarxLPe141LdLEHudZd4pO+7p6ra9DZxL2grP6ri+0B9uBFIW9KYn/ATvIGrcXNeLzgFS/glK4DwGoAL882bvgB1IsgKieI1mfONE+FkIlT0pgcl5Wm9sQMrHRMrVjI48CkcaKY4N5d6pU6OXyCeZQv3vuuiA27q7F6Mk9voK010564l17zWBOstNPZq0r+cke5Epoc437/V4MlVSEvZb3tXe6p4lQNkM5HPAjicnyYdgL6wDxHDupJi2HSsTEXVCOGSdKcbljXq1iURadQxGLGvLKaCYIs0NuysA9MxBnF8F9no7FLqAyrJX9ZS+gmuYyq/4K7WEwkQIEvED651AyhXXfyk+hy8IIpNXCGq3C6TR7ZCC2CGTEVrhEz3uzFU3CX/FD8aQhZ9bkDAmWKgPHdCSaO5cf1qKf9iKE3qSqj2ZERRrlenrMSokCQ73al4wql4dV4bIDu/czRLASt6WsNgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3021.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(366004)(39860400002)(396003)(2616005)(30864003)(8936002)(6486002)(110136005)(316002)(5660300002)(2906002)(6512007)(66556008)(53546011)(38100700002)(921005)(66476007)(31696002)(7416002)(186003)(86362001)(16526019)(66946007)(44832011)(7406005)(478600001)(83380400001)(31686004)(36756003)(8676002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U0ttVlc1NU5nak8zSlpIZFN4YnV3NkJKc2dFK2RpQTU1OFZ0SmFDdHBROVQ0?=
 =?utf-8?B?MGlJUWJZU1JDQ0hnYzBkMHdFQ3pEME1ESXRDZmpIaE1UKzlQSDNNZXBaYmF3?=
 =?utf-8?B?MG5jWGRDY1NKRVdjOVB5M0VwMTRFVEtsYzl3TVRvLzZqU05JK2FpdC9keEky?=
 =?utf-8?B?Z2hLRE5DVHRlL2NhTG5MQ0VoQXZVUWJmaHMwYUVUUk9tNk8zNFQ3MHVMZXpx?=
 =?utf-8?B?VlhpMktWcmh0dXBjeVJqOE9sZnIya0IybGZOUUFtdURFWEczS2FVckMrRDlS?=
 =?utf-8?B?Z21FNVQ0T3JGOUM3LzhhZkRsaWJsV3RsK3I4QlJSN2Nqd2RHckd6WW9uRDZk?=
 =?utf-8?B?R1pQRTVTNEhuY0pwK09UdGNGQjRUYWR0b1N4L09tRnBxZzRvelFMcitZWjVr?=
 =?utf-8?B?Q2ZLNXJLNnc1MVBlR0FGdlBxSEJnbnliZE1IK1hDZXVocktXTjQwNEJGRWFV?=
 =?utf-8?B?bVllbCtYUjNKY2p5UVB4dkZ4dVdlTGdFQzJnZDN3c0hESGp3d3FMdXJqOEFh?=
 =?utf-8?B?aXY5cEhQU3lMakJ0Q3VLVG9ucVliZUhNL1BNblhNeXJQWWhmTTA3YmY0MzJN?=
 =?utf-8?B?NFN1K2VwWGRFTXRVM3RSSEpJc0NLTTlHUVhsWld2N3k5aGtpRzJWMk1tWUNC?=
 =?utf-8?B?bUIvTUROWHBPcU1XbGFsK1hVNWpDSEI3ZHhPaHVzK3dkWmwrNDN3cXViM1JJ?=
 =?utf-8?B?MWcvODUyWGdiTE12Y3RwdGsxM3djNWVuMGQzNkJOS0R6MHNWd0ppWFlPOTRX?=
 =?utf-8?B?dkFvOE1HTDVJVFJkRzk4UWc0NVdBTFgvbmJ6TzZvMGpYcEJxdi9TS2UrU3E3?=
 =?utf-8?B?SmxrdHNHcVNOaCtDeG5uUWllSnJwQUkrTnBJR01Ibk5YeU1zR2pDb3haQ0Qw?=
 =?utf-8?B?Z2swTU5UYVI0ZFFUQVEzcUVabnd0ZlFrQ0RvN0NCS3Zyd0F1WS9vL2xWZkI5?=
 =?utf-8?B?dnh6eUdETU9DeTJrQ2paVGgvbmhqR2Q2VHVZQ0pTUzV5ZERqdEV5QlhTYzFQ?=
 =?utf-8?B?bkZiNkJhVlpKaWYyZFd2aVBqTmVQbmNvUUcraHV3cXRkZVY4L0lyL2Z6czhu?=
 =?utf-8?B?S09HRVlpQzQyaFBFLzllUWtnZFN4WUZIRHNNbnJYc1F0SWtIZ245R0tRRU5Q?=
 =?utf-8?B?a25CWEVmcWVlbG9KYWZvRHJ5VXFZZEtlQXV2aENQZDV4UlVBc1orSkd0MWFv?=
 =?utf-8?B?ZDRiWUUvMDJJZFU3bzU2MGE1KzFEMHVqWU8zQVdwVkVFTDVNanZZdjNuTERv?=
 =?utf-8?B?Mk9SeGNzaWVvM1E4bW40QmQ4b3RUcGN5MDNzREVINUd4bGpVVXhCclVJeUdq?=
 =?utf-8?B?THdRemQzeENFQ1JlM0FIdUtkT3NKVlM0Q1RkbERvQWZkTldhTmJjanIyUitD?=
 =?utf-8?B?d2RSU2NzVC9aSU5aUmEvZ0ZZWlFqSlpDQ3diSGpGK1JZTjZHM3JZY2J3ZnZQ?=
 =?utf-8?B?WjI4VWo5UVRPUllTUk9hWFIyRkpLcE9uOEd2K2F4QzNpUGVsb3c0OWpIcGZp?=
 =?utf-8?B?U2kwSEt0SHRLTGpkdnIyZkRzQmJpaWt6cEZ5UlF1em1iQTRRLzVENVhzNm1j?=
 =?utf-8?B?Zm1ZckpjK2JDbG9xdXVva2U5YjJKWjNzbTd2ZzZSK1R2YVhvaUJQY0ZJcG5o?=
 =?utf-8?B?TzlNNHdyREZEY1NXT25WVUNkMEMzRWlDNUZKRFhHODk0dWJNZGEySTB1SjlB?=
 =?utf-8?B?MFhOTVBjUHl4eHpZaFRJOE9uYVVyNWJ3eDFsL0JOL2N6emZtc2NydW5nWFlR?=
 =?utf-8?B?cFJYdk9YYWtNOFQxU3dZTzRDR09Ib2hVSUVVNi80UTVQTnBHK281VHk1b1Z2?=
 =?utf-8?B?WTFlSHB5S1U4TG4xTHI4Zz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9656f742-b41f-41cc-3612-08d929e9a6c2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3021.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 19:22:55.4198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffnV6KQBUMGCLLI5A7AF3j7bT+i2ZU+1r5WX9clcWsq3Tni59/ExnvpEugeRt11+IOtSvpvK2ewSDZqVBwou3tntoL8vMp4/91Il4+aUdxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB3455
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10008 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106070131
X-Proofpoint-ORIG-GUID: povHGuoZT2ZkVAm01kGItFREioEGf3Ck
X-Proofpoint-GUID: povHGuoZT2ZkVAm01kGItFREioEGf3Ck
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 6/3/21 2:14 PM, Jing Zhang wrote:
> Provides a file descriptor per VM to read VM stats info/data.
> Provides a file descriptor per vCPU to read vCPU stats info/data.
>
> Reviewed-by: David Matlack <dmatlack@google.com>
> Reviewed-by: Ricardo Koller <ricarkol@google.com>
> Signed-off-by: Jing Zhang <jingzhangos@google.com>
> ---
>   arch/arm64/kvm/guest.c    |  26 +++++++
>   arch/mips/kvm/mips.c      |  52 +++++++++++++
>   arch/powerpc/kvm/book3s.c |  52 +++++++++++++
>   arch/powerpc/kvm/booke.c  |  45 +++++++++++
>   arch/s390/kvm/kvm-s390.c  | 117 ++++++++++++++++++++++++++++
>   arch/x86/kvm/x86.c        |  53 +++++++++++++
>   include/linux/kvm_host.h  | 132 ++++++++++++++++++++++++++++++++
>   include/uapi/linux/kvm.h  |  50 ++++++++++++
>   virt/kvm/kvm_main.c       | 155 ++++++++++++++++++++++++++++++++++++++
>   9 files changed, 682 insertions(+)
>
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 4962331d01e6..c68addd38cf8 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -28,6 +28,32 @@
>   
>   #include "trace.h"
>   
> +struct _kvm_stats_desc kvm_vm_stats_desc[] = DEFINE_VM_STATS_DESC();
> +
> +struct _kvm_stats_header kvm_vm_stats_header = {
> +	.name_size = KVM_STATS_NAME_LEN,
> +	.count = ARRAY_SIZE(kvm_vm_stats_desc),
> +	.desc_offset = sizeof(struct kvm_stats_header),
> +	.data_offset = sizeof(struct kvm_stats_header) +
> +		sizeof(kvm_vm_stats_desc),
> +};
> +
> +struct _kvm_stats_desc kvm_vcpu_stats_desc[] = DEFINE_VCPU_STATS_DESC(
> +	STATS_DESC_COUNTER("hvc_exit_stat"),
> +	STATS_DESC_COUNTER("wfe_exit_stat"),
> +	STATS_DESC_COUNTER("wfi_exit_stat"),
> +	STATS_DESC_COUNTER("mmio_exit_user"),
> +	STATS_DESC_COUNTER("mmio_exit_kernel"),
> +	STATS_DESC_COUNTER("exits"));
> +
> +struct _kvm_stats_header kvm_vcpu_stats_header = {
> +	.name_size = KVM_STATS_NAME_LEN,
> +	.count = ARRAY_SIZE(kvm_vcpu_stats_desc),
> +	.desc_offset = sizeof(struct kvm_stats_header),
> +	.data_offset = sizeof(struct kvm_stats_header) +
> +		sizeof(kvm_vcpu_stats_desc),
> +};
> +
>   struct kvm_stats_debugfs_item debugfs_entries[] = {
>   	VCPU_STAT_GENERIC("halt_successful_poll", halt_successful_poll),
>   	VCPU_STAT_GENERIC("halt_attempted_poll", halt_attempted_poll),
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index ff205b35719b..eb8fd4a96952 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -38,6 +38,58 @@
>   #define VECTORSPACING 0x100	/* for EI/VI mode */
>   #endif
>   
> +struct _kvm_stats_desc kvm_vm_stats_desc[] = DEFINE_VM_STATS_DESC();
> +
> +struct _kvm_stats_header kvm_vm_stats_header = {
> +	.name_size = KVM_STATS_NAME_LEN,
> +	.count = ARRAY_SIZE(kvm_vm_stats_desc),
> +	.desc_offset = sizeof(struct kvm_stats_header),
> +	.data_offset = sizeof(struct kvm_stats_header) +
> +		sizeof(kvm_vm_stats_desc),
> +};
> +
> +struct _kvm_stats_desc kvm_vcpu_stats_desc[] = DEFINE_VCPU_STATS_DESC(
> +	STATS_DESC_COUNTER("wait_exits"),
> +	STATS_DESC_COUNTER("cache_exits"),
> +	STATS_DESC_COUNTER("signal_exits"),
> +	STATS_DESC_COUNTER("int_exits"),
> +	STATS_DESC_COUNTER("cop_unusable_exits"),
> +	STATS_DESC_COUNTER("tlbmod_exits"),
> +	STATS_DESC_COUNTER("tlbmiss_ld_exits"),
> +	STATS_DESC_COUNTER("tlbmiss_st_exits"),
> +	STATS_DESC_COUNTER("addrerr_st_exits"),
> +	STATS_DESC_COUNTER("addrerr_ld_exits"),
> +	STATS_DESC_COUNTER("syscall_exits"),
> +	STATS_DESC_COUNTER("resvd_inst_exits"),
> +	STATS_DESC_COUNTER("break_inst_exits"),
> +	STATS_DESC_COUNTER("trap_inst_exits"),
> +	STATS_DESC_COUNTER("msa_fpe_exits"),
> +	STATS_DESC_COUNTER("fpe_exits"),
> +	STATS_DESC_COUNTER("msa_disabled_exits"),
> +	STATS_DESC_COUNTER("flush_dcache_exits"),
> +#ifdef CONFIG_KVM_MIPS_VZ
> +	STATS_DESC_COUNTER("vz_gpsi_exits"),
> +	STATS_DESC_COUNTER("vz_gsfc_exits"),
> +	STATS_DESC_COUNTER("vz_hc_exits"),
> +	STATS_DESC_COUNTER("vz_grr_exits"),
> +	STATS_DESC_COUNTER("vz_gva_exits"),
> +	STATS_DESC_COUNTER("vz_ghfc_exits"),
> +	STATS_DESC_COUNTER("vz_gpa_exits"),
> +	STATS_DESC_COUNTER("vz_resvd_exits"),
> +#ifdef CONFIG_CPU_LOONGSON64
> +	STATS_DESC_COUNTER("vz_cpucfg_exits"),
> +#endif
> +#endif
> +	);
> +
> +struct _kvm_stats_header kvm_vcpu_stats_header = {
> +	.name_size = KVM_STATS_NAME_LEN,
> +	.count = ARRAY_SIZE(kvm_vcpu_stats_desc),
> +	.desc_offset = sizeof(struct kvm_stats_header),
> +	.data_offset = sizeof(struct kvm_stats_header) +
> +		sizeof(kvm_vcpu_stats_desc),
> +};
> +
>   struct kvm_stats_debugfs_item debugfs_entries[] = {
>   	VCPU_STAT("wait", wait_exits),
>   	VCPU_STAT("cache", cache_exits),
> diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
> index 92cdb4175945..53fb1da049a7 100644
> --- a/arch/powerpc/kvm/book3s.c
> +++ b/arch/powerpc/kvm/book3s.c
> @@ -38,6 +38,58 @@
>   
>   /* #define EXIT_DEBUG */
>   
> +struct _kvm_stats_desc kvm_vm_stats_desc[] = DEFINE_VM_STATS_DESC(
> +	STATS_DESC_ICOUNTER("num_2M_pages"),
> +	STATS_DESC_ICOUNTER("num_1G_pages"));
> +
> +struct _kvm_stats_header kvm_vm_stats_header = {
> +	.name_size = KVM_STATS_NAME_LEN,
> +	.count = ARRAY_SIZE(kvm_vm_stats_desc),
> +	.desc_offset = sizeof(struct kvm_stats_header),
> +	.data_offset = sizeof(struct kvm_stats_header) +
> +		sizeof(kvm_vm_stats_desc),
> +};
> +
> +struct _kvm_stats_desc kvm_vcpu_stats_desc[] = DEFINE_VCPU_STATS_DESC(
> +	STATS_DESC_COUNTER("sum_exits"),
> +	STATS_DESC_COUNTER("mmio_exits"),
> +	STATS_DESC_COUNTER("signal_exits"),
> +	STATS_DESC_COUNTER("light_exits"),
> +	STATS_DESC_COUNTER("itlb_real_miss_exits"),
> +	STATS_DESC_COUNTER("itlb_virt_miss_exits"),
> +	STATS_DESC_COUNTER("dtlb_real_miss_exits"),
> +	STATS_DESC_COUNTER("dtlb_virt_miss_exits"),
> +	STATS_DESC_COUNTER("syscall_exits"),
> +	STATS_DESC_COUNTER("isi_exits"),
> +	STATS_DESC_COUNTER("dsi_exits"),
> +	STATS_DESC_COUNTER("emulated_inst_exits"),
> +	STATS_DESC_COUNTER("dec_exits"),
> +	STATS_DESC_COUNTER("ext_intr_exits"),
> +	STATS_DESC_TIME_NSEC("halt_wait_ns"),
> +	STATS_DESC_COUNTER("halt_successful_wait"),
> +	STATS_DESC_COUNTER("dbell_exits"),
> +	STATS_DESC_COUNTER("gdbell_exits"),
> +	STATS_DESC_COUNTER("ld"),
> +	STATS_DESC_COUNTER("st"),
> +	STATS_DESC_COUNTER("pf_storage"),
> +	STATS_DESC_COUNTER("pf_instruc"),
> +	STATS_DESC_COUNTER("sp_storage"),
> +	STATS_DESC_COUNTER("sp_instruc"),
> +	STATS_DESC_COUNTER("queue_intr"),
> +	STATS_DESC_COUNTER("ld_slow"),
> +	STATS_DESC_COUNTER("st_slow"),
> +	STATS_DESC_COUNTER("pthru_all"),
> +	STATS_DESC_COUNTER("pthru_host"),
> +	STATS_DESC_COUNTER("pthru_bad_aff"));
> +
> +struct _kvm_stats_header kvm_vcpu_stats_header = {
> +	.name_size = KVM_STATS_NAME_LEN,
> +	.count = ARRAY_SIZE(kvm_vcpu_stats_desc),
> +	.desc_offset = sizeof(struct kvm_stats_header),
> +	.data_offset = sizeof(struct kvm_stats_header) +
> +		sizeof(kvm_vcpu_stats_desc),
> +};
> +
>   struct kvm_stats_debugfs_item debugfs_entries[] = {
>   	VCPU_STAT("exits", sum_exits),
>   	VCPU_STAT("mmio", mmio_exits),
> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
> index 80d3b39aa7ac..02f1e147d224 100644
> --- a/arch/powerpc/kvm/booke.c
> +++ b/arch/powerpc/kvm/booke.c
> @@ -36,6 +36,51 @@
>   
>   unsigned long kvmppc_booke_handlers;
>   
> +struct _kvm_stats_desc kvm_vm_stats_desc[] = DEFINE_VM_STATS_DESC(
> +	STATS_DESC_ICOUNTER("num_2M_pages"),
> +	STATS_DESC_ICOUNTER("num_1G_pages"));
> +
> +struct _kvm_stats_header kvm_vm_stats_header = {
> +	.name_size = KVM_STATS_NAME_LEN,
> +	.count = ARRAY_SIZE(kvm_vm_stats_desc),
> +	.desc_offset = sizeof(struct kvm_stats_header),
> +	.data_offset = sizeof(struct kvm_stats_header) +
> +		sizeof(kvm_vm_stats_desc),
> +};
> +
> +struct _kvm_stats_desc kvm_vcpu_stats_desc[] = DEFINE_VCPU_STATS_DESC(
> +	STATS_DESC_COUNTER("sum_exits"),
> +	STATS_DESC_COUNTER("mmio_exits"),
> +	STATS_DESC_COUNTER("signal_exits"),
> +	STATS_DESC_COUNTER("light_exits"),
> +	STATS_DESC_COUNTER("itlb_real_miss_exits"),
> +	STATS_DESC_COUNTER("itlb_virt_miss_exits"),
> +	STATS_DESC_COUNTER("dtlb_real_miss_exits"),
> +	STATS_DESC_COUNTER("dtlb_virt_miss_exits"),
> +	STATS_DESC_COUNTER("syscall_exits"),
> +	STATS_DESC_COUNTER("isi_exits"),
> +	STATS_DESC_COUNTER("dsi_exits"),
> +	STATS_DESC_COUNTER("emulated_inst_exits"),
> +	STATS_DESC_COUNTER("dec_exits"),
> +	STATS_DESC_COUNTER("ext_intr_exits"),
> +	STATS_DESC_TIME_NSEC("halt_wait_ns"),
> +	STATS_DESC_COUNTER("halt_successful_wait"),
> +	STATS_DESC_COUNTER("dbell_exits"),
> +	STATS_DESC_COUNTER("gdbell_exits"),
> +	STATS_DESC_COUNTER("ld"),
> +	STATS_DESC_COUNTER("st"),
> +	STATS_DESC_COUNTER("pthru_all"),
> +	STATS_DESC_COUNTER("pthru_host"),
> +	STATS_DESC_COUNTER("pthru_bad_aff"));
> +
> +struct _kvm_stats_header kvm_vcpu_stats_header = {
> +	.name_size = KVM_STATS_NAME_LEN,
> +	.count = ARRAY_SIZE(kvm_vcpu_stats_desc),
> +	.desc_offset = sizeof(struct kvm_stats_header),
> +	.data_offset = sizeof(struct kvm_stats_header) +
> +		sizeof(kvm_vcpu_stats_desc),
> +};
> +
>   struct kvm_stats_debugfs_item debugfs_entries[] = {
>   	VCPU_STAT("mmio", mmio_exits),
>   	VCPU_STAT("sig", signal_exits),
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index e8bc7cd06794..4e2141bee3bc 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -58,6 +58,123 @@
>   #define VCPU_IRQS_MAX_BUF (sizeof(struct kvm_s390_irq) * \
>   			   (KVM_MAX_VCPUS + LOCAL_IRQS))
>   
> +struct _kvm_stats_desc kvm_vm_stats_desc[] = DEFINE_VM_STATS_DESC(
> +	STATS_DESC_COUNTER("inject_io"),
> +	STATS_DESC_COUNTER("inject_float_mchk"),
> +	STATS_DESC_COUNTER("inject_pfault_done"),
> +	STATS_DESC_COUNTER("inject_service_signal"),
> +	STATS_DESC_COUNTER("inject_virtio"));
> +
> +struct _kvm_stats_header kvm_vm_stats_header = {
> +	.name_size = KVM_STATS_NAME_LEN,
> +	.count = ARRAY_SIZE(kvm_vm_stats_desc),
> +	.desc_offset = sizeof(struct kvm_stats_header),
> +	.data_offset = sizeof(struct kvm_stats_header) +
> +		sizeof(kvm_vm_stats_desc),
> +};
> +
> +struct _kvm_stats_desc kvm_vcpu_stats_desc[] = DEFINE_VCPU_STATS_DESC(
> +	STATS_DESC_COUNTER("exit_userspace"),
> +	STATS_DESC_COUNTER("exit_null"),
> +	STATS_DESC_COUNTER("exit_external_request"),
> +	STATS_DESC_COUNTER("exit_io_request"),
> +	STATS_DESC_COUNTER("exit_external_interrupt"),
> +	STATS_DESC_COUNTER("exit_stop_request"),
> +	STATS_DESC_COUNTER("exit_validity"),
> +	STATS_DESC_COUNTER("exit_instruction"),
> +	STATS_DESC_COUNTER("exit_pei"),
> +	STATS_DESC_COUNTER("halt_no_poll_steal"),
> +	STATS_DESC_COUNTER("instruction_lctl"),
> +	STATS_DESC_COUNTER("instruction_lctlg"),
> +	STATS_DESC_COUNTER("instruction_stctl"),
> +	STATS_DESC_COUNTER("instruction_stctg"),
> +	STATS_DESC_COUNTER("exit_program_interruption"),
> +	STATS_DESC_COUNTER("exit_instr_and_program"),
> +	STATS_DESC_COUNTER("exit_operation_exception"),
> +	STATS_DESC_COUNTER("deliver_ckc"),
> +	STATS_DESC_COUNTER("deliver_cputm"),
> +	STATS_DESC_COUNTER("deliver_external_call"),
> +	STATS_DESC_COUNTER("deliver_emergency_signal"),
> +	STATS_DESC_COUNTER("deliver_service_signal"),
> +	STATS_DESC_COUNTER("deliver_virtio"),
> +	STATS_DESC_COUNTER("deliver_stop_signal"),
> +	STATS_DESC_COUNTER("deliver_prefix_signal"),
> +	STATS_DESC_COUNTER("deliver_restart_signal"),
> +	STATS_DESC_COUNTER("deliver_program"),
> +	STATS_DESC_COUNTER("deliver_io"),
> +	STATS_DESC_COUNTER("deliver_machine_check"),
> +	STATS_DESC_COUNTER("exit_wait_state"),
> +	STATS_DESC_COUNTER("inject_ckc"),
> +	STATS_DESC_COUNTER("inject_cputm"),
> +	STATS_DESC_COUNTER("inject_external_call"),
> +	STATS_DESC_COUNTER("inject_emergency_signal"),
> +	STATS_DESC_COUNTER("inject_mchk"),
> +	STATS_DESC_COUNTER("inject_pfault_init"),
> +	STATS_DESC_COUNTER("inject_program"),
> +	STATS_DESC_COUNTER("inject_restart"),
> +	STATS_DESC_COUNTER("inject_set_prefix"),
> +	STATS_DESC_COUNTER("inject_stop_signal"),
> +	STATS_DESC_COUNTER("instruction_epsw"),
> +	STATS_DESC_COUNTER("instruction_gs"),
> +	STATS_DESC_COUNTER("instruction_io_other"),
> +	STATS_DESC_COUNTER("instruction_lpsw"),
> +	STATS_DESC_COUNTER("instruction_lpswe"),
> +	STATS_DESC_COUNTER("instruction_pfmf"),
> +	STATS_DESC_COUNTER("instruction_ptff"),
> +	STATS_DESC_COUNTER("instruction_sck"),
> +	STATS_DESC_COUNTER("instruction_sckpf"),
> +	STATS_DESC_COUNTER("instruction_stidp"),
> +	STATS_DESC_COUNTER("instruction_spx"),
> +	STATS_DESC_COUNTER("instruction_stpx"),
> +	STATS_DESC_COUNTER("instruction_stap"),
> +	STATS_DESC_COUNTER("instruction_iske"),
> +	STATS_DESC_COUNTER("instruction_ri"),
> +	STATS_DESC_COUNTER("instruction_rrbe"),
> +	STATS_DESC_COUNTER("instruction_sske"),
> +	STATS_DESC_COUNTER("instruction_ipte_interlock"),
> +	STATS_DESC_COUNTER("instruction_stsi"),
> +	STATS_DESC_COUNTER("instruction_stfl"),
> +	STATS_DESC_COUNTER("instruction_tb"),
> +	STATS_DESC_COUNTER("instruction_tpi"),
> +	STATS_DESC_COUNTER("instruction_tprot"),
> +	STATS_DESC_COUNTER("instruction_tsch"),
> +	STATS_DESC_COUNTER("instruction_sie"),
> +	STATS_DESC_COUNTER("instruction_essa"),
> +	STATS_DESC_COUNTER("instruction_sthyi"),
> +	STATS_DESC_COUNTER("instruction_sigp_sense"),
> +	STATS_DESC_COUNTER("instruction_sigp_sense_running"),
> +	STATS_DESC_COUNTER("instruction_sigp_external_call"),
> +	STATS_DESC_COUNTER("instruction_sigp_emergency"),
> +	STATS_DESC_COUNTER("instruction_sigp_cond_emergency"),
> +	STATS_DESC_COUNTER("instruction_sigp_start"),
> +	STATS_DESC_COUNTER("instruction_sigp_stop"),
> +	STATS_DESC_COUNTER("instruction_sigp_stop_store_status"),
> +	STATS_DESC_COUNTER("instruction_sigp_store_status"),
> +	STATS_DESC_COUNTER("instruction_sigp_store_adtl_status"),
> +	STATS_DESC_COUNTER("instruction_sigp_arch"),
> +	STATS_DESC_COUNTER("instruction_sigp_prefix"),
> +	STATS_DESC_COUNTER("instruction_sigp_restart"),
> +	STATS_DESC_COUNTER("instruction_sigp_init_cpu_reset"),
> +	STATS_DESC_COUNTER("instruction_sigp_cpu_reset"),
> +	STATS_DESC_COUNTER("instruction_sigp_unknown"),
> +	STATS_DESC_COUNTER("diagnose_10"),
> +	STATS_DESC_COUNTER("diagnose_44"),
> +	STATS_DESC_COUNTER("diagnose_9c"),
> +	STATS_DESC_COUNTER("diagnose_9c_ignored"),
> +	STATS_DESC_COUNTER("diagnose_258"),
> +	STATS_DESC_COUNTER("diagnose_308"),
> +	STATS_DESC_COUNTER("diagnose_500"),
> +	STATS_DESC_COUNTER("diagnose_other"),
> +	STATS_DESC_COUNTER("pfault_sync"));
> +
> +struct _kvm_stats_header kvm_vcpu_stats_header = {
> +	.name_size = KVM_STATS_NAME_LEN,
> +	.count = ARRAY_SIZE(kvm_vcpu_stats_desc),
> +	.desc_offset = sizeof(struct kvm_stats_header),
> +	.data_offset = sizeof(struct kvm_stats_header) +
> +		sizeof(kvm_vcpu_stats_desc),
> +};
> +
>   struct kvm_stats_debugfs_item debugfs_entries[] = {
>   	VCPU_STAT("userspace_handled", exit_userspace),
>   	VCPU_STAT("exit_null", exit_null),
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 96d10253218a..8e900c482626 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -214,6 +214,59 @@ EXPORT_SYMBOL_GPL(host_xss);
>   u64 __read_mostly supported_xss;
>   EXPORT_SYMBOL_GPL(supported_xss);
>   
> +struct _kvm_stats_desc kvm_vm_stats_desc[] = DEFINE_VM_STATS_DESC(
> +	STATS_DESC_COUNTER("mmu_shadow_zapped"),
> +	STATS_DESC_COUNTER("mmu_pte_write"),
> +	STATS_DESC_COUNTER("mmu_pde_zapped"),
> +	STATS_DESC_COUNTER("mmu_flooded"),
> +	STATS_DESC_COUNTER("mmu_recycled"),
> +	STATS_DESC_COUNTER("mmu_cache_miss"),
> +	STATS_DESC_ICOUNTER("mmu_unsync"),
> +	STATS_DESC_ICOUNTER("largepages"),
> +	STATS_DESC_ICOUNTER("nx_largepages_splits"),
> +	STATS_DESC_ICOUNTER("max_mmu_page_hash_collisions"));
> +
> +struct _kvm_stats_header kvm_vm_stats_header = {
> +	.name_size = KVM_STATS_NAME_LEN,
> +	.count = ARRAY_SIZE(kvm_vm_stats_desc),
> +	.desc_offset = sizeof(struct kvm_stats_header),
> +	.data_offset = sizeof(struct kvm_stats_header) +
> +		sizeof(kvm_vm_stats_desc),
> +};
> +
> +struct _kvm_stats_desc kvm_vcpu_stats_desc[] = DEFINE_VCPU_STATS_DESC(
> +	STATS_DESC_COUNTER("pf_fixed"),
> +	STATS_DESC_COUNTER("pf_guest"),
> +	STATS_DESC_COUNTER("tlb_flush"),
> +	STATS_DESC_COUNTER("invlpg"),
> +	STATS_DESC_COUNTER("exits"),
> +	STATS_DESC_COUNTER("io_exits"),
> +	STATS_DESC_COUNTER("mmio_exits"),
> +	STATS_DESC_COUNTER("signal_exits"),
> +	STATS_DESC_COUNTER("irq_window_exits"),
> +	STATS_DESC_COUNTER("nmi_window_exits"),
> +	STATS_DESC_COUNTER("l1d_flush"),
> +	STATS_DESC_COUNTER("halt_exits"),
> +	STATS_DESC_COUNTER("request_irq_exits"),
> +	STATS_DESC_COUNTER("irq_exits"),
> +	STATS_DESC_COUNTER("host_state_reload"),
> +	STATS_DESC_COUNTER("fpu_reload"),
> +	STATS_DESC_COUNTER("insn_emulation"),
> +	STATS_DESC_COUNTER("insn_emulation_fail"),
> +	STATS_DESC_COUNTER("hypercalls"),
> +	STATS_DESC_COUNTER("irq_injections"),
> +	STATS_DESC_COUNTER("nmi_injections"),
> +	STATS_DESC_COUNTER("req_event"),
> +	STATS_DESC_COUNTER("nested_run"));
> +
> +struct _kvm_stats_header kvm_vcpu_stats_header = {
> +	.name_size = KVM_STATS_NAME_LEN,
> +	.count = ARRAY_SIZE(kvm_vcpu_stats_desc),
> +	.desc_offset = sizeof(struct kvm_stats_header),
> +	.data_offset = sizeof(struct kvm_stats_header) +
> +		sizeof(kvm_vcpu_stats_desc),
> +};
> +
>   struct kvm_stats_debugfs_item debugfs_entries[] = {
>   	VCPU_STAT("pf_fixed", pf_fixed),
>   	VCPU_STAT("pf_guest", pf_guest),
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 1870fa928762..873e21af36be 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1240,6 +1240,19 @@ struct kvm_stats_debugfs_item {
>   	int mode;
>   };
>   
> +struct _kvm_stats_header {
> +	__u32 name_size;
> +	__u32 count;
> +	__u32 desc_offset;
> +	__u32 data_offset;
> +};
> +
> +#define KVM_STATS_NAME_LEN	48
> +struct _kvm_stats_desc {
> +	struct kvm_stats_desc desc;
> +	char name[KVM_STATS_NAME_LEN];
> +};
> +
>   #define KVM_DBGFS_GET_MODE(dbgfs_item)                                         \
>   	((dbgfs_item)->mode ? (dbgfs_item)->mode : 0644)
>   
> @@ -1253,8 +1266,127 @@ struct kvm_stats_debugfs_item {
>   	{ n, offsetof(struct kvm_vcpu, stat.generic.x),			       \
>   	  KVM_STAT_VCPU, ## __VA_ARGS__ }
>   
> +#define STATS_DESC(stat, type, unit, scale, exp)			       \
> +	{								       \
> +		{							       \
> +			.flags = type | unit | scale,			       \
> +			.exponent = exp,				       \
> +			.size = 1					       \
> +		},							       \
> +		.name = stat,						       \
> +	}
> +#define STATS_DESC_CUMULATIVE(name, unit, scale, exponent)		       \
> +	STATS_DESC(name, KVM_STATS_TYPE_CUMULATIVE, unit, scale, exponent)
> +#define STATS_DESC_INSTANT(name, unit, scale, exponent)			       \
> +	STATS_DESC(name, KVM_STATS_TYPE_INSTANT, unit, scale, exponent)
> +
> +/* Cumulative counter */
> +#define STATS_DESC_COUNTER(name)					       \
> +	STATS_DESC_CUMULATIVE(name, KVM_STATS_UNIT_NONE,		       \
> +		KVM_STATS_BASE_POW10, 0)
> +/* Instantaneous counter */
> +#define STATS_DESC_ICOUNTER(name)					       \
> +	STATS_DESC_INSTANT(name, KVM_STATS_UNIT_NONE,			       \
> +		KVM_STATS_BASE_POW10, 0)
> +
> +/* Cumulative clock cycles */
> +#define STATS_DESC_CYCLE(name)						       \
> +	STATS_DESC_CUMULATIVE(name, KVM_STATS_UNIT_CYCLES,		       \
> +		KVM_STATS_BASE_POW10, 0)
> +/* Instantaneous clock cycles */
> +#define STATS_DESC_ICYCLE(name)						       \
> +	STATS_DESC_INSTANT(name, KVM_STATS_UNIT_CYCLES,			       \
> +		KVM_STATS_BASE_POW10, 0)
> +
> +/* Cumulative memory size in Byte */
> +#define STATS_DESC_SIZE_BYTE(name)					       \
> +	STATS_DESC_CUMULATIVE(name, KVM_STATS_UNIT_BYTES,		       \
> +		KVM_STATS_BASE_POW2, 0)
> +/* Cumulative memory size in KiByte */
> +#define STATS_DESC_SIZE_KBYTE(name)					       \
> +	STATS_DESC_CUMULATIVE(name, KVM_STATS_UNIT_BYTES,		       \
> +		KVM_STATS_BASE_POW2, 10)
> +/* Cumulative memory size in MiByte */
> +#define STATS_DESC_SIZE_MBYTE(name)					       \
> +	STATS_DESC_CUMULATIVE(name, KVM_STATS_UNIT_BYTES,		       \
> +		KVM_STATS_BASE_POW2, 20)
> +/* Cumulative memory size in GiByte */
> +#define STATS_DESC_SIZE_GBYTE(name)					       \
> +	STATS_DESC_CUMULATIVE(name, KVM_STATS_UNIT_BYTES,		       \
> +		KVM_STATS_BASE_POW2, 30)
> +
> +/* Instantaneous memory size in Byte */
> +#define STATS_DESC_ISIZE_BYTE(name)					       \
> +	STATS_DESC_INSTANT(name, KVM_STATS_UNIT_BYTES,			       \
> +		KVM_STATS_BASE_POW2, 0)
> +/* Instantaneous memory size in KiByte */
> +#define STATS_DESC_ISIZE_KBYTE(name)					       \
> +	STATS_DESC_INSTANT(name, KVM_STATS_UNIT_BYTES,			       \
> +		KVM_STATS_BASE_POW2, 10)
> +/* Instantaneous memory size in MiByte */
> +#define STATS_DESC_ISIZE_MBYTE(name)					       \
> +	STATS_DESC_INSTANT(name, KVM_STATS_UNIT_BYTES,			       \
> +		KVM_STATS_BASE_POW2, 20)
> +/* Instantaneous memory size in GiByte */
> +#define STATS_DESC_ISIZE_GBYTE(name)					       \
> +	STATS_DESC_INSTANT(name, KVM_STATS_UNIT_BYTES,			       \
> +		KVM_STATS_BASE_POW2, 30)
> +
> +/* Cumulative time in second */
> +#define STATS_DESC_TIME_SEC(name)					       \
> +	STATS_DESC_CUMULATIVE(name, KVM_STATS_UNIT_SECONDS,		       \
> +		KVM_STATS_BASE_POW10, 0)
> +/* Cumulative time in millisecond */
> +#define STATS_DESC_TIME_MSEC(name)					       \
> +	STATS_DESC_CUMULATIVE(name, KVM_STATS_UNIT_SECONDS,		       \
> +		KVM_STATS_BASE_POW10, -3)
> +/* Cumulative time in microsecond */
> +#define STATS_DESC_TIME_USEC(name)					       \
> +	STATS_DESC_CUMULATIVE(name, KVM_STATS_UNIT_SECONDS,		       \
> +		KVM_STATS_BASE_POW10, -6)
> +/* Cumulative time in nanosecond */
> +#define STATS_DESC_TIME_NSEC(name)					       \
> +	STATS_DESC_CUMULATIVE(name, KVM_STATS_UNIT_SECONDS,		       \
> +		KVM_STATS_BASE_POW10, -9)
> +
> +/* Instantaneous time in second */
> +#define STATS_DESC_ITIME_SEC(name)					       \
> +	STATS_DESC_INSTANT(name, KVM_STATS_UNIT_SECONDS,		       \
> +		KVM_STATS_BASE_POW10, 0)
> +/* Instantaneous time in millisecond */
> +#define STATS_DESC_ITIME_MSEC(name)					       \
> +	STATS_DESC_INSTANT(name, KVM_STATS_UNIT_SECONDS,		       \
> +		KVM_STATS_BASE_POW10, -3)
> +/* Instantaneous time in microsecond */
> +#define STATS_DESC_ITIME_USEC(name)					       \
> +	STATS_DESC_INSTANT(name, KVM_STATS_UNIT_SECONDS,		       \
> +		KVM_STATS_BASE_POW10, -6)
> +/* Instantaneous time in nanosecond */
> +#define STATS_DESC_ITIME_NSEC(name)					       \
> +	STATS_DESC_INSTANT(name, KVM_STATS_UNIT_SECONDS,		       \
> +		KVM_STATS_BASE_POW10, -9)
> +
> +#define DEFINE_VM_STATS_DESC(...) {					       \
> +	STATS_DESC_COUNTER("remote_tlb_flush"),				       \
> +	## __VA_ARGS__							       \
> +}
> +
> +#define DEFINE_VCPU_STATS_DESC(...) {					       \
> +	STATS_DESC_COUNTER("halt_successful_poll"),			       \
> +	STATS_DESC_COUNTER("halt_attempted_poll"),			       \
> +	STATS_DESC_COUNTER("halt_poll_invalid"),			       \
> +	STATS_DESC_COUNTER("halt_wakeup"),				       \
> +	STATS_DESC_TIME_NSEC("halt_poll_success_ns"),			       \
> +	STATS_DESC_TIME_NSEC("halt_poll_fail_ns"),			       \
> +	## __VA_ARGS__							       \
> +}
> +
>   extern struct kvm_stats_debugfs_item debugfs_entries[];
>   extern struct dentry *kvm_debugfs_dir;
> +extern struct _kvm_stats_header kvm_vm_stats_header;
> +extern struct _kvm_stats_header kvm_vcpu_stats_header;
> +extern struct _kvm_stats_desc kvm_vm_stats_desc[];
> +extern struct _kvm_stats_desc kvm_vcpu_stats_desc[];
>   
>   #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
>   static inline int mmu_notifier_retry(struct kvm *kvm, unsigned long mmu_seq)
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 3fd9a7e9d90c..dcfa0315e3f9 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1082,6 +1082,7 @@ struct kvm_ppc_resize_hpt {
>   #define KVM_CAP_SGX_ATTRIBUTE 196
>   #define KVM_CAP_VM_COPY_ENC_CONTEXT_FROM 197
>   #define KVM_CAP_PTP_KVM 198
> +#define KVM_CAP_STATS_BINARY_FD 199
>   
>   #ifdef KVM_CAP_IRQ_ROUTING
>   
> @@ -1898,4 +1899,53 @@ struct kvm_dirty_gfn {
>   #define KVM_BUS_LOCK_DETECTION_OFF             (1 << 0)
>   #define KVM_BUS_LOCK_DETECTION_EXIT            (1 << 1)
>   
> +#define KVM_STATS_ID_MAXLEN		64
> +
> +struct kvm_stats_header {
> +	char id[KVM_STATS_ID_MAXLEN];
> +	__u32 name_size;
> +	__u32 count;
> +	__u32 desc_offset;
> +	__u32 data_offset;
> +};
> +
> +#define KVM_STATS_TYPE_SHIFT		0
> +#define KVM_STATS_TYPE_MASK		(0xF << KVM_STATS_TYPE_SHIFT)
> +#define KVM_STATS_TYPE_CUMULATIVE	(0x0 << KVM_STATS_TYPE_SHIFT)
> +#define KVM_STATS_TYPE_INSTANT		(0x1 << KVM_STATS_TYPE_SHIFT)
> +#define KVM_STATS_TYPE_MAX		KVM_STATS_TYPE_INSTANT
> +
> +#define KVM_STATS_UNIT_SHIFT		4
> +#define KVM_STATS_UNIT_MASK		(0xF << KVM_STATS_UNIT_SHIFT)
> +#define KVM_STATS_UNIT_NONE		(0x0 << KVM_STATS_UNIT_SHIFT)
> +#define KVM_STATS_UNIT_BYTES		(0x1 << KVM_STATS_UNIT_SHIFT)
> +#define KVM_STATS_UNIT_SECONDS		(0x2 << KVM_STATS_UNIT_SHIFT)
> +#define KVM_STATS_UNIT_CYCLES		(0x3 << KVM_STATS_UNIT_SHIFT)
> +#define KVM_STATS_UNIT_MAX		KVM_STATS_UNIT_CYCLES
> +
> +#define KVM_STATS_BASE_SHIFT		8
> +#define KVM_STATS_BASE_MASK		(0xF << KVM_STATS_BASE_SHIFT)
> +#define KVM_STATS_BASE_POW10		(0x0 << KVM_STATS_BASE_SHIFT)
> +#define KVM_STATS_BASE_POW2		(0x1 << KVM_STATS_BASE_SHIFT)
> +#define KVM_STATS_BASE_MAX		KVM_STATS_BASE_POW2
> +
> +struct kvm_stats_desc {
> +	__u32 flags;
> +	__s16 exponent;
> +	__u16 size;
> +	__u32 unused1;
> +	__u32 unused2;
> +	char name[0];
> +};
> +
> +struct kvm_vm_stats_data {
> +	unsigned long value[0];
> +};
> +
> +struct kvm_vcpu_stats_data {
> +	__u64 value[0];
> +};
> +
> +#define KVM_GET_STATS_FD  _IOR(KVMIO,  0xcc, struct kvm_stats_header)
> +
>   #endif /* __LINUX_KVM_H */
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index f6ad5b080994..d84bb17bdea8 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3409,6 +3409,115 @@ static int kvm_vcpu_ioctl_set_sigmask(struct kvm_vcpu *vcpu, sigset_t *sigset)
>   	return 0;
>   }
>   
> +static ssize_t kvm_stats_read(char *id, struct _kvm_stats_header *header,
> +		struct _kvm_stats_desc *desc, void *stats, size_t size_stats,
> +		char __user *user_buffer, size_t size, loff_t *offset)
> +{
> +	ssize_t copylen, len, remain = size;
> +	size_t size_header, size_desc;
> +	loff_t pos = *offset;
> +	char __user *dest = user_buffer;
> +	void *src;
> +
> +	size_header = sizeof(*header);
> +	size_desc = header->count * sizeof(*desc);
> +
> +	len = KVM_STATS_ID_MAXLEN + size_header + size_desc + size_stats - pos;
> +	len = min(len, remain);
> +	if (len <= 0)
> +		return 0;
> +	remain = len;
> +
> +	/* Copy kvm stats header id string */
> +	copylen = KVM_STATS_ID_MAXLEN - pos;
> +	copylen = min(copylen, remain);
> +	if (copylen > 0) {
> +		src = id + pos;
> +		if (copy_to_user(dest, src, copylen))
> +			return -EFAULT;
> +		remain -= copylen;
> +		pos += copylen;
> +		dest += copylen;
> +	}
> +	/* Copy kvm stats header */
> +	copylen = KVM_STATS_ID_MAXLEN + size_header - pos;
> +	copylen = min(copylen, remain);
> +	if (copylen > 0) {
> +		src = header + pos - KVM_STATS_ID_MAXLEN;
> +		if (copy_to_user(dest, src, copylen))
> +			return -EFAULT;
> +		remain -= copylen;
> +		pos += copylen;
> +		dest += copylen;
> +	}
> +	/* Copy kvm stats descriptors */
> +	copylen = header->desc_offset + size_desc - pos;
> +	copylen = min(copylen, remain);
> +	if (copylen > 0) {
> +		src = desc + pos - header->desc_offset;
> +		if (copy_to_user(dest, src, copylen))
> +			return -EFAULT;
> +		remain -= copylen;
> +		pos += copylen;
> +		dest += copylen;
> +	}
> +	/* Copy kvm stats values */
> +	copylen = header->data_offset + size_stats - pos;
> +	copylen = min(copylen, remain);
> +	if (copylen > 0) {
> +		src = stats + pos - header->data_offset;
> +		if (copy_to_user(dest, src, copylen))
> +			return -EFAULT;
> +		remain -= copylen;
> +		pos += copylen;
> +		dest += copylen;
> +	}
> +
> +	*offset = pos;
> +	return len;
> +}
> +
> +static ssize_t kvm_vcpu_stats_read(struct file *file, char __user *user_buffer,
> +			      size_t size, loff_t *offset)
> +{
> +	char id[KVM_STATS_ID_MAXLEN];
> +	struct kvm_vcpu *vcpu = file->private_data;
> +
> +	snprintf(id, sizeof(id), "kvm-%d/vcpu-%d",
> +			task_pid_nr(current), vcpu->vcpu_id);
> +	return kvm_stats_read(id, &kvm_vcpu_stats_header,
> +			&kvm_vcpu_stats_desc[0], &vcpu->stat,
> +			sizeof(vcpu->stat), user_buffer, size, offset);
> +}
> +
> +static const struct file_operations kvm_vcpu_stats_fops = {
> +	.read = kvm_vcpu_stats_read,
> +	.llseek = noop_llseek,
> +};
> +
> +static int kvm_vcpu_ioctl_get_stats_fd(struct kvm_vcpu *vcpu)
> +{
> +	int fd;
> +	struct file *file;
> +	char name[15 + ITOA_MAX_LEN + 1];
> +
> +	snprintf(name, sizeof(name), "kvm-vcpu-stats:%d", vcpu->vcpu_id);
> +
> +	fd = get_unused_fd_flags(O_CLOEXEC);
> +	if (fd < 0)
> +		return fd;
> +
> +	file = anon_inode_getfile(name, &kvm_vcpu_stats_fops, vcpu, O_RDONLY);
> +	if (IS_ERR(file)) {
> +		put_unused_fd(fd);
> +		return PTR_ERR(file);
> +	}
> +	file->f_mode |= FMODE_PREAD;
> +	fd_install(fd, file);
> +
> +	return fd;
> +}
> +
>   static long kvm_vcpu_ioctl(struct file *filp,
>   			   unsigned int ioctl, unsigned long arg)
>   {
> @@ -3606,6 +3715,10 @@ static long kvm_vcpu_ioctl(struct file *filp,
>   		r = kvm_arch_vcpu_ioctl_set_fpu(vcpu, fpu);
>   		break;
>   	}
> +	case KVM_GET_STATS_FD: {
> +		r = kvm_vcpu_ioctl_get_stats_fd(vcpu);
> +		break;
> +	}
>   	default:
>   		r = kvm_arch_vcpu_ioctl(filp, ioctl, arg);
>   	}
> @@ -3864,6 +3977,8 @@ static long kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>   #else
>   		return 0;
>   #endif
> +	case KVM_CAP_STATS_BINARY_FD:

Nit:   KVM_CAP_BINARY_STATS_FD

> +		return 1;
>   	default:
>   		break;
>   	}
> @@ -3967,6 +4082,43 @@ static int kvm_vm_ioctl_enable_cap_generic(struct kvm *kvm,
>   	}
>   }
>   
> +static ssize_t kvm_vm_stats_read(struct file *file, char __user *user_buffer,
> +			      size_t size, loff_t *offset)
> +{
> +	char id[KVM_STATS_ID_MAXLEN];
> +	struct kvm *kvm = file->private_data;
> +
> +	snprintf(id, sizeof(id), "kvm-%d", task_pid_nr(current));
> +	return kvm_stats_read(id, &kvm_vm_stats_header, &kvm_vm_stats_desc[0],
> +		&kvm->stat, sizeof(kvm->stat), user_buffer, size, offset);
> +}
> +
> +static const struct file_operations kvm_vm_stats_fops = {
> +	.read = kvm_vm_stats_read,
> +	.llseek = noop_llseek,
> +};
> +
> +static int kvm_vm_ioctl_get_stats_fd(struct kvm *kvm)
> +{
> +	int fd;
> +	struct file *file;
> +
> +	fd = get_unused_fd_flags(O_CLOEXEC);
> +	if (fd < 0)
> +		return fd;
> +
> +	file = anon_inode_getfile("kvm-vm-stats",
> +			&kvm_vm_stats_fops, kvm, O_RDONLY);
> +	if (IS_ERR(file)) {
> +		put_unused_fd(fd);
> +		return PTR_ERR(file);
> +	}
> +	file->f_mode |= FMODE_PREAD;
> +	fd_install(fd, file);
> +
> +	return fd;
> +}
> +
>   static long kvm_vm_ioctl(struct file *filp,
>   			   unsigned int ioctl, unsigned long arg)
>   {
> @@ -4149,6 +4301,9 @@ static long kvm_vm_ioctl(struct file *filp,
>   	case KVM_RESET_DIRTY_RINGS:
>   		r = kvm_vm_ioctl_reset_dirty_pages(kvm);
>   		break;
> +	case KVM_GET_STATS_FD:
> +		r = kvm_vm_ioctl_get_stats_fd(kvm);
> +		break;
>   	default:
>   		r = kvm_arch_vm_ioctl(filp, ioctl, arg);
>   	}
Reviewed-by: Krish Sadhukhan <krish.sadhukhan@oracle.com>
