Return-Path: <linux-mips+bounces-15380-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ootHU/HRGpi0woAu9opvQ
	(envelope-from <linux-mips+bounces-15380-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 09:52:47 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA276EADE6
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 09:52:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Cj9hPbcb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ApqBAPP2;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15380-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15380-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 888A5300A749
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2026 07:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBD23B442F;
	Wed,  1 Jul 2026 07:49:42 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DF93B47F9
	for <linux-mips@vger.kernel.org>; Wed,  1 Jul 2026 07:49:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892182; cv=none; b=e6yW0LselQHa0WvXpeIMVzb2Wvx4nZcQ/HR+YX7nERhNIjMJN3QP6mSqaijEfBDU25mWEieGL1l3dF28XBxqYOqDpmbI+gvqcbwNtCNUSKqexdwi1792qp9JGNKUSWrzoP5Kk7i8jE0PfLwvUsW5XLlcOWH8LpA7Db2qgMi7Vc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892182; c=relaxed/simple;
	bh=dOh9xmXTaJtuTgus69f1JF7eDwhISXp7TeLbF9tj9mI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsgSp/8Mk5oCXZ4CiKrQ82rwvBnDdRFzz4lxLy3FeTqe797Wn3zLn3q/4WU7WYK72MheAo8ltQwDvPjKBWW9li4AKIxBlaMn5GWnDbDEdDzDBBWC/wj7jVFsew6F9OxewvJzVuGcZ9/TnYFlPz1OwIjuF75ANxYR6BUGqGRYJ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cj9hPbcb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApqBAPP2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lTDP140751
	for <linux-mips@vger.kernel.org>; Wed, 1 Jul 2026 07:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tO+wGssHzCkwgLc1fyD6Bz2Zw0cVzq6FhbGs/0ytjg0=; b=Cj9hPbcbpWbTK+tF
	PIcK3PBPMaXTUuCv/sDEIZo5Y0/0nqsviQe1Sa2GXh1P431Pj3fnTpSPlaXTeDwn
	TejVsKuSbEwrL/m/AnaWDqhBuceZkeHF0ZsVBuk9HfOe8gugsp87HitC4zRCFssi
	k6ElK05VWfaFfa4ppKG4OagIrOqSKu1qzdm2FACtXswaGGtn3D+wovGnFISOY7GX
	OMvVD6rpHgm0xjYIk5hYyHMTHswLl1ybVHT0kDKMfw8cMtPhTll65hQ48rMgVW19
	6WCyma+Z3Xe8amIkZHwcyG4+oRHAwiriPfz76n406OSuMECtU/mf/hi9TS+eXug3
	o6S6LA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j99k858-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2026 07:49:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c149e14dcso4904001cf.0
        for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2026 00:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892179; x=1783496979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tO+wGssHzCkwgLc1fyD6Bz2Zw0cVzq6FhbGs/0ytjg0=;
        b=ApqBAPP2HqmALWuQYkhWtBjPp+2Sf6/0jfw/9bIhn37EGo2dz1ChSm9CM/d2HrEbAE
         bLJ6JOLbHfwszJPqBfuByKPvf5m647KUr1+di7hM54hgENGS82lkmcWVqlQk7y3vIlAl
         rRIDAEgxhneAuqQqD0v6wvJ4jb/5PDXmWTmJWtGpmtHxR2L2I2R9XpR8MpYJZ25Jw0Gg
         ulNYv3SspPsYwbE9MoB9ddldlOnsMJD7i1O/LZKUgfbDa01pABODs4BAPyuuJpuE+e0X
         JLnI3NlYOqcaRBi7issXg3NQYfaXk3dexKDRBiqzbNvXKgC31RVcPnQrY7mY/ii5FcCd
         v+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892179; x=1783496979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tO+wGssHzCkwgLc1fyD6Bz2Zw0cVzq6FhbGs/0ytjg0=;
        b=MzlvCXQm+49/P+mXWuAhhhRyVn18rVyDBeUcsHyeG4RTh2ZlSe2Rb3VKM3xjpDxY6E
         kzxVPE4UfEarqT5vlBwy76Lvp8e9+XYqXNDsWw7XZNYttp3A2m+p/9No1cKtzgfE9hnv
         5H+29KCfUA9dgBGtxxadZndb8yuZOywv0yAmp+4GvxrbXDIFWCkhOfOJ+nMeIcqzlmH/
         58dWAD8NdmngxZsguoATKBpDF0uwCcmVygLZ51OB0mIdu1p9EwSDQzNIE4d5rHie4p59
         A7XT8+PExBfzQUhWo9L6wqj1JEIxEQXx42MeoVln3/Z4TVwXJzUFucmEflNRqOnFvzVr
         Dnsw==
X-Forwarded-Encrypted: i=1; AFNElJ8/5iWyQ4DtgaKW3j27qFwnDp8/au56/CqjbEcE91OsdfydQlbX0bhxL+MdL3B1uYXKUUqu3R5KVeqe@vger.kernel.org
X-Gm-Message-State: AOJu0Yztl909+D+8p32hnTNGB+LnI9GBj8QqiZ5yH0k+PyCpI7VnKWQg
	ZhpTt+p2p7X2ggyfQi5oRCVoU3bZGxwVGDv3GP6sgY6F9veLel8dnWKUFIuOZ8djrgjhAJQpbjO
	QvOyjEwsJ2owq40XJAbeer2n5vZkZ1H7/s8JgvQLrE5WU6Rbm8jKi535O3R5GQaIm
X-Gm-Gg: AfdE7ckL9ffSdVvE6YeOvyqpVEUtS24/Kkuzv5ttG3BYxAbHuGcoqiZyvs1lJTkFsWJ
	cnHDXb3Wv46R8zACOY68p85hK1MuY6XisuE+srSFhfF7Xb8WIYICt+2TDMR0hsvWfwDH38bhtsz
	SVyd8nS/aILOEstEYz5Dw/rs5nP48g6rlsqdRPm4qqQY88MkJfusDqt3mM0/+Lwbk3XEjGJtAI/
	hX5oeypn+5o1EXjsmLA+q2/ZCzcFFvKKnXacVg3+YD70xaqWZzRbIXdEvbtns146tUhd/VdOf4t
	b1FIIcivSf4HrjfGcp05id71xblBWtCTbkX3AZ3ywPdBS5JHGA4NryPzkqCqUa0Xne3spuQIstU
	3RuhHj2yS1ZT1D1KZtOT703xZb/S0JAZMwM8P5Tz2HCv4W781dnMH0aHOp9Ek/w==
X-Received: by 2002:a05:622a:4292:b0:517:146d:2cb5 with SMTP id d75a77b69052e-51c17e8f1ecmr60558831cf.20.1782892179089;
        Wed, 01 Jul 2026 00:49:39 -0700 (PDT)
X-Received: by 2002:a05:622a:4292:b0:517:146d:2cb5 with SMTP id d75a77b69052e-51c17e8f1ecmr60558621cf.20.1782892178662;
        Wed, 01 Jul 2026 00:49:38 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d194bbsm13031759f8f.3.2026.07.01.00.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:49:37 -0700 (PDT)
Message-ID: <4eb126f4-f9c8-471e-94f1-ff40675dbe73@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:49:35 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] ARM: VDSO: Respect COMPAT_32BIT_TIME
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-api@vger.kernel.org,
        sparclinux@vger.kernel.org
References: <20260630-vdso-compat_32bit_time-v2-0-520d194640dd@linutronix.de>
 <20260630-vdso-compat_32bit_time-v2-5-520d194640dd@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-5-520d194640dd@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX4UzhztYTz7CO
 prdQjQZ5wDQ+bzgbUJOR4gSMZAquUyiGOWwP8+L5Rh4EPY7dAjgu+J7FbYlovxMXn3ehcc0VZ/2
 lrmPrhNqQiVjIW2fSAFccJuIUA3jHkw=
X-Proofpoint-ORIG-GUID: wUK33H5j_sewXzXLeICGzg57rANZnpuv
X-Proofpoint-GUID: wUK33H5j_sewXzXLeICGzg57rANZnpuv
X-Authority-Analysis: v=2.4 cv=bNcm5v+Z c=1 sm=1 tr=0 ts=6a44c694 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gC1PrsFcNpCBvASTUOwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX/Ndvx4phcBuw
 FfJllZwcma8zLIp60d72zO9cCpFnuHS/KzPj1VxX7aZP5tA6pRq3wkbHqnBFL3UUgk8M4KrgJyJ
 qtWCXxEiHbIjn4WoouL2M8jAtL9lcOX8E4TPx57sPb7VJLkemF254u3YA35eFjlPwoG6RjnsGcX
 bVzVJhVaGJY8r96ttWtEkeK+Un0n8lDS9MIbf0OhbiLbwsf0aaOxRDR7HcsB0QeCx6GsbiZJmDc
 EUPcs8WJ4ckHb1ZcnDx7Yj/9uVIprdRXIqubsdlcWPdHIdDQaOZYFqAV01E7cw0kis3eWHvBzTW
 TAf+waBsaz/jXMebHdPiF1eFuNBbcKMVn475HwckZ5iMXyjfFLefwDnBoKQrsHtDOSwj0JJUYLi
 1wVhlfKYQc6QtXl6xdWN3wFJOPEBKyXtHgfoAQldAY4xxdvOcfxtqLBhFcSmc+7eW49IMg8j+IS
 2l0N6zpWuQPFPa99VmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15380-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:jstultz@google.com,m:sboyd@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,m:arnd@arndb.de,m:linux-api@vger.kernel.org,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,linutronix.de:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_TO(0.00)[linutronix.de,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de,google.com,davemloft.net,gaisler.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBA276EADE6

On 30/6/26 09:38, Thomas WeiÃschuh wrote:
> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
> provide any 32-bit time related functionality. This is the intended
> effect of the kconfig option and also the fallback system calls would
> also not be implemented.
> 
> Currently the kconfig option does not affect the gettimeofday() syscall,
> so also keep that in the vDSO.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   arch/arm/vdso/vdso.lds.S      |  2 ++
>   arch/arm/vdso/vgettimeofday.c | 14 ++++++++------
>   2 files changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

