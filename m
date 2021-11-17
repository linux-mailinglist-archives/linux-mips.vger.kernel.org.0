Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A294541DE
	for <lists+linux-mips@lfdr.de>; Wed, 17 Nov 2021 08:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233462AbhKQHdk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Nov 2021 02:33:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44214 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233408AbhKQHdi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Nov 2021 02:33:38 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH5CXHa019264;
        Wed, 17 Nov 2021 07:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6aUyWvGs2d2xIZAvoepVwnYdUm6nHahA0QpsvQPs9WA=;
 b=YA2EofTIX0WTWep6ZB6L5Eeoflkzjwi6qw7KBMzLNBn9tkpm1f35Ir9BOa0up3ryyJDW
 isfjTWagd/XFGvMOeR/WZAA7ff15KRD7q5OECprxC29i/fP60+1FW5jxnvcnz/r+7YbD
 sHj1nJWob/v/yfV4fsMZdWSapOghYi/mzkTQhHtAqVGB7SWPZkSV6XT0+y5kzuINdNZ9
 XgLgCUnpAIplCJjLGipi0s3Lkvrrd6Kt6y5iUKqxbTA838Ko3F90DLiyXhmtfrsQUMxE
 7PzNi6U5jniw9Vyj3d8FRv+lx0rMrBuzivFAwDskJu8Mf5sQ9tjKj7yquesKzT3iAg+n Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3ccucwtnn5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Nov 2021 07:29:53 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AH6fDc0018891;
        Wed, 17 Nov 2021 07:29:52 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3ccucwtnmc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Nov 2021 07:29:52 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AH7MkbU026793;
        Wed, 17 Nov 2021 07:29:49 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma03fra.de.ibm.com with ESMTP id 3ca50a5jy7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Nov 2021 07:29:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 1AH7MnYx59113860
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 07:22:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EE501AE045;
        Wed, 17 Nov 2021 07:29:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A8EA7AE057;
        Wed, 17 Nov 2021 07:29:45 +0000 (GMT)
Received: from [9.171.32.217] (unknown [9.171.32.217])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed, 17 Nov 2021 07:29:45 +0000 (GMT)
Message-ID: <2fcab5d3-fee1-a211-aaf5-a2569b5a7ed8@de.ibm.com>
Date:   Wed, 17 Nov 2021 08:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/7] KVM: s390: Use Makefile.kvm for common files
Content-Language: en-US
To:     David Woodhouse <dwmw2@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>, kvm <kvm@vger.kernel.org>
Cc:     Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        "jmattson @ google . com" <jmattson@google.com>,
        "wanpengli @ tencent . com" <wanpengli@tencent.com>,
        "seanjc @ google . com" <seanjc@google.com>,
        "vkuznets @ redhat . com" <vkuznets@redhat.com>,
        "mtosatti @ redhat . com" <mtosatti@redhat.com>,
        "joro @ 8bytes . org" <joro@8bytes.org>, karahmed@amazon.com,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Anup Patel <anup.patel@wdc.com>, kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org
References: <5047c2591310e503491850ef683f251395247d50.camel@infradead.org>
 <20211116115051.119956-1-dwmw2@infradead.org>
 <20211116115051.119956-3-dwmw2@infradead.org>
From:   Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <20211116115051.119956-3-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aUsuyE-YVW6NNV1mmm64oovIwEx-v71q
X-Proofpoint-ORIG-GUID: oQF21GtcP3exrUxbnxHVvurGZD_FqBc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_02,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170033
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Am 16.11.21 um 12:50 schrieb David Woodhouse:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Looks good.
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>

> ---
>   arch/s390/kvm/Makefile | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
> index b3aaadc60ead..e4f50453cf7f 100644
> --- a/arch/s390/kvm/Makefile
> +++ b/arch/s390/kvm/Makefile
> @@ -3,13 +3,11 @@
>   #
>   # Copyright IBM Corp. 2008
>   
> -KVM := ../../../virt/kvm
> -common-objs = $(KVM)/kvm_main.o $(KVM)/eventfd.o  $(KVM)/async_pf.o \
> -	      $(KVM)/irqchip.o $(KVM)/vfio.o $(KVM)/binary_stats.o
> +include $(srctree)/virt/kvm/Makefile.kvm
>   
>   ccflags-y := -Ivirt/kvm -Iarch/s390/kvm
>   
> -kvm-objs := $(common-objs) kvm-s390.o intercept.o interrupt.o priv.o sigp.o
> +kvm-objs := kvm-s390.o intercept.o interrupt.o priv.o sigp.o
>   kvm-objs += diag.o gaccess.o guestdbg.o vsie.o pv.o
>   
>   obj-$(CONFIG_KVM) += kvm.o
> 
