Return-Path: <linux-mips+bounces-5872-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B06A6997FE0
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 10:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ABD52818DE
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 08:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA75202F94;
	Thu, 10 Oct 2024 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Vbd8BJhX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DF8202F82;
	Thu, 10 Oct 2024 07:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728546977; cv=none; b=ZskJMwyfsa38M2HCtZjgEh9aV1b9FEjmlYAEKX9f3d8O5wEn2vtIDVH0x8Gie2dzwdC39rYZS7ZF6t7F40z5Nvor/CZI3FYMMYrZZlouVtSNI4rKDYbTrCDUEzfCWrwUw6JHcpC5sChEzL0NccMKpl5QLQZhJjKYTrkayvYfgT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728546977; c=relaxed/simple;
	bh=VuvHz4SWG5F6N5+oQQ7jkQw92S5yb/85Y8p6NavJMCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6qiRSx4diUvEPXy2RUzAUwHYMWDn9QznTjohoacOcJfSnsluazBJoAdPxnmt6ncg44P3YBSekuW1Wdro0/e2jLRmbPUv3C5giq2SYLIaFf7syg2vPS2xObYTteGwivsDlkCjFV/rI7SgDZ78mQ5IT9qryTO6xmqZ50g7PvqJ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Vbd8BJhX; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A5HxdT031385;
	Thu, 10 Oct 2024 07:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=pp1; bh=T
	1YOOaZuWHA7KhxMc5clxN0oNw6z6RZVTMdcvyZw1Fs=; b=Vbd8BJhXLUtSdzOVL
	2SiGmCBj54EjRio8+KQ+dQh57mrOmix45wQhn7Dvum7Nw1O2UQfX09U6OUtqIB+0
	BcIy0BeiGU1lbE6SJ8ZtvrOBV5HuE+TwRa9rDQinZ4tG3A54viNCL02mn08+9mOv
	VK9+WhExutjLivC6JwMwcTnCkB5c5zoYG/L9dgatYQxoYJx0gsg/thfv+dLhZuy2
	E7FQqCsGUr6JMY1c3KuaQhBeipIFeowjqKZUTWfHO7LPlP02KJKS5+1kv0+vLlFy
	9MtlPQcFxpnaT0fdS4HzZU5aATJj7Cua1qLa4Kd9zvZDWsxuFdGCCDDjKy+0ipB5
	UVUnA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4268nerq6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:54:54 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49A7srwb026744;
	Thu, 10 Oct 2024 07:54:53 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4268nerq6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:54:53 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49A727pw022855;
	Thu, 10 Oct 2024 07:54:52 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 423jg165sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:54:52 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49A7smB059048374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 07:54:48 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CC382004E;
	Thu, 10 Oct 2024 07:54:48 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 767FE20040;
	Thu, 10 Oct 2024 07:54:47 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Oct 2024 07:54:47 +0000 (GMT)
Date: Thu, 10 Oct 2024 09:54:45 +0200
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
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 03/28] s390/vdso: Drop LBASE_VDSO
Message-ID: <20241010075445.6997-B-hca@linux.ibm.com>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <20241010-vdso-generic-base-v1-3-b64f0842d512@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010-vdso-generic-base-v1-3-b64f0842d512@linutronix.de>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZTty2fTVsMW7K9-FlAxmqo2xTiuVy1bh
X-Proofpoint-GUID: zgvrkuY4KEw1IJWAOvjaf-n0Y1hgj5aS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_04,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 adultscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 mlxlogscore=370 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410100049

On Thu, Oct 10, 2024 at 09:01:05AM +0200, Thomas Weiﬂschuh wrote:
> This constant is always "0", providing no value and making the logic
> harder to understand.
> Also prepare for a consolidation of the vdso linkerscript logic by
> aligning it with other architectures.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/s390/include/asm/vdso.h         | 3 ---
>  arch/s390/kernel/vdso32/vdso32.lds.S | 2 +-
>  arch/s390/kernel/vdso64/vdso64.lds.S | 2 +-
>  3 files changed, 2 insertions(+), 5 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com>

