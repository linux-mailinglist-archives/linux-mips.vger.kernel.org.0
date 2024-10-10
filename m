Return-Path: <linux-mips+bounces-5871-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF91997FDB
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 10:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C99002819A9
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 08:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C26202F8A;
	Thu, 10 Oct 2024 07:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Q5pjE1ER"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB33F202F81;
	Thu, 10 Oct 2024 07:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728546976; cv=none; b=Z/cShoWEafy+17d6qQYcbs7E0KTfjQAi3RFITmyxZwsUtMMNmf472EcYcMH6N4tsbLc79/UVWFp9nGmLrxIoPKh9NXoFLGKEOF/qTNLXzCO3vJ4qmPp8G9+YKJ84XzqmdhoVlFiQc134PmAtBAM0VX0Byb2+IT7K3XltlFya9Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728546976; c=relaxed/simple;
	bh=RIxzWDo6Kxs1DyGz/2Ns/C4Sj7jBRuNfdZi5GGDFnV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWQxiAhP+BHUGoONQxHcYwK+Bi5GXyh96lk+tj/Cb2bldz6eTG4AkkKhYQ4bmfSjD9Xul+iuRv1R7hh9uPfGTPlp/eDOkBAj+7j3huwIigTBL19yvRZxZJCRw+S2zG6TVhpoc2oos9i5K5GpI/Juf+YTY7w50hfX1htpcBkmmVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Q5pjE1ER; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A7YT0q005037;
	Thu, 10 Oct 2024 07:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=pp1; bh=0
	yVn8tI3lyhXM3ZeiBQKCb5kXwilQgq2bp9dwcfLyYI=; b=Q5pjE1ERdXenpwSx9
	H+3tZabSr8DH7Beyxy8drvLqU3Ht7Ga5XyW6C2PTL3fPAuIoZz3HzJyiSMoG5gdj
	JjsNnDX89G4/TG2MQ2BW0D7oNe96JjJi5G8uZ9mB/IapFOPGaPI969vLuEtTw6gE
	D6w8jekAr6Nzp3HaTEja4FUr8tp1ftTFqMfyfMTZNpMqVCBoXY9zpXfp1OYNxpHv
	kbP2c54yz9Ep1Dqaj3eGZkuA+jhRxDx4QQwAhzA66Rkp22oRkrTbO5vLbuYRFTlL
	+Pd5u72MCl/j+dMSEbRW7gnpYCpEOaMHPSE7LD2eBuG5IA3bgsjtNp/LMzgsdAiG
	yYq+A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426anb82uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:55:18 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49A7tHik016153;
	Thu, 10 Oct 2024 07:55:17 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426anb82uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:55:17 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49A544L3013784;
	Thu, 10 Oct 2024 07:55:16 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 423fssen8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:55:16 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49A7tCoY59048420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 07:55:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC8702004B;
	Thu, 10 Oct 2024 07:55:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCECD2004E;
	Thu, 10 Oct 2024 07:55:11 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Oct 2024 07:55:11 +0000 (GMT)
Date: Thu, 10 Oct 2024 09:55:10 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Guo Ren <guoren@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Russell King <linux@armlinux.org.uk>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        "Theodore Ts'o" <tytso@mit.edu>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 28/28] vdso: Rename struct arch_vdso_data to
 arch_vdso_time_data
Message-ID: <20241010075510.6997-C-hca@linux.ibm.com>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <20241010-vdso-generic-base-v1-28-b64f0842d512@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010-vdso-generic-base-v1-28-b64f0842d512@linutronix.de>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: txKjIm6oMyh-bYlrWVbJ8zIUfT6c90P5
X-Proofpoint-GUID: EzJFZF0xHPJktynCv2z269EPy5OXcKam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_04,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=644 priorityscore=1501
 clxscore=1011 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100049

On Thu, Oct 10, 2024 at 09:01:30AM +0200, Thomas Weißschuh wrote:
> From: Nam Cao <namcao@linutronix.de>
> 
> The struct arch_vdso_data is only about vdso time data. So rename it to
> arch_vdso_time_data to make it obvious.
> Non time-related data will be migrated out of these structs soon.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>  arch/Kconfig                                        |  2 +-
>  arch/riscv/Kconfig                                  |  2 +-
>  arch/riscv/include/asm/vdso/{data.h => time_data.h} |  8 ++++----
>  arch/riscv/kernel/sys_hwprobe.c                     |  2 +-
>  arch/riscv/kernel/vdso/hwprobe.c                    |  4 ++--
>  arch/s390/Kconfig                                   |  2 +-
>  arch/s390/include/asm/vdso/data.h                   | 12 ------------
>  arch/s390/include/asm/vdso/time_data.h              | 12 ++++++++++++
>  include/vdso/datapage.h                             |  8 ++++----
>  9 files changed, 26 insertions(+), 26 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390

