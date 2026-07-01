Return-Path: <linux-mips+bounces-15381-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nYVAM4jHRGpx0woAu9opvQ
	(envelope-from <linux-mips+bounces-15381-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 09:53:44 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2530E6EAE17
	for <lists+linux-mips@lfdr.de>; Wed, 01 Jul 2026 09:53:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HMfEvFRx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UQU2B+oo;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15381-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15381-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F10773098A62
	for <lists+linux-mips@lfdr.de>; Wed,  1 Jul 2026 07:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735C43C09E5;
	Wed,  1 Jul 2026 07:50:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D703BFE31
	for <linux-mips@vger.kernel.org>; Wed,  1 Jul 2026 07:50:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782892245; cv=none; b=MlVtl1UXuVJtCBiLvvD1kDrkuNnwuvzf2HFkuI7BaVAmp0bjXYyEdHyodiuXEjvM9+HUrnRc0dCYVZ0mL49j4dR0Y9jszuNfimIzv7+I6BIl/JNfMWBDQX3/SJMQW+cAsR08gXh4rl/gh4b9z3PMBdHBmk9ssExiGndJaB8Fiho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782892245; c=relaxed/simple;
	bh=93sm2BTMOedB4laJKM79zV17PWAvrYmlViJMtNY7qBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=maE2XT0jMmOJvs94aIwTcKBaRIMucAhljy47KQmq9nXsNKtyae+VF5C1pcsoMbK8Op1hbsG00qhndA/cl5DsaNXbHn8eerVkPHaO+dWhvd+obMlyuQy9DinisLHMaVJQwf8DPBSjVzAITe93suJWDvoXwqMKVFE1HXc9A6Wac5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HMfEvFRx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQU2B+oo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lWOr059158
	for <linux-mips@vger.kernel.org>; Wed, 1 Jul 2026 07:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMxsrivrDzOgZ9YW+PMIw9Z8lpknReER1Olw9eV9c6E=; b=HMfEvFRx6nTIAtVE
	sL68tzthEIkQnLnX9Rc76Z+NLktj5+RvYSmZqPoXUEE+E5o+LkIIfuBJhwlpfY+J
	RMsiwlNHkpZV8rVnPyoGGxfPrNXNI5lgDH8tqDgvkEi0b2grHF8dSFgpODSc72rh
	0EjqgCOhK8TjyWAMMdGQRQAKFqqBtvWcjIDdgCvtjeMJc+b1syAik1phPUjpeiHT
	+mHBBG2Zs+XrFMXA0iCK41ffFLvfiku70zwRFhoOXlj4J9G7qR2SE7MvpJEhyGW6
	6kHzfxIseJu5NpodNx6tFH/VgtdgKXREk5GcvUEPZwLchVew9XyUnsRofUu/umcl
	K3tSsA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sjxh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2026 07:50:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so35764885a.1
        for <linux-mips@vger.kernel.org>; Wed, 01 Jul 2026 00:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782892242; x=1783497042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMxsrivrDzOgZ9YW+PMIw9Z8lpknReER1Olw9eV9c6E=;
        b=UQU2B+ooJr/twS4oahz3htXdnnF3e6i10vSkp7Hp6khwUwMlT6iNMZ41HMC8HC7hEi
         9tL3dsjoavlnFu6jxslBE9BKGMYyV5633hg63uZvuuyKCO60lNyYW7u36mmuWtfl/Sxe
         nIYRxA+Aa2G3QCkDwtOvEejxN/GEeSfkRltRiStvs6iiGMFaz5TsVgLCmFEkBojQ1alh
         8lz9ETZkVhf6MaZ3HrxkgZQL0aNsyXa1ZzA1fsJ+i0PvaiRLe3/ptpQ6G4id87toVYgw
         /nWnCSD5sBW88HXXqGbWJa4NRqOq/vpwkOm+H/o2Jgj6nwx/UBrpf2/itoqCTuM66Hps
         60EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892242; x=1783497042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMxsrivrDzOgZ9YW+PMIw9Z8lpknReER1Olw9eV9c6E=;
        b=sPLDUcTGU5vYUXlMbSlcYmWW2yaiEV85cquED2kWCVW7D0FhqkLNBjME3N3KtU2oP/
         u9xbJOgG92Y0a66prAZmjLBNld24564f/1cywVbSMFCotO1yB3vhZ0FOSVxUfUR+C0XB
         XXipBCuZ3fCUxhsPBoDqXgQVj9Z+HsNtr2pb0ld8+nNfiqyGXrEeyyLHbCGESiLE/5t7
         5ZLthxt00LCZIgVvOCLBsRGUovZQ3yllhgQFMuocvqnBozsKgVlwuvU7BKXDDrY6F8t8
         +DX+D5b017fe9MSfsmncpIHxmV7SSCnrYm2NWfRA0iQvf9Dq52AO64corRYiDh9Oy9hD
         kd3g==
X-Forwarded-Encrypted: i=1; AFNElJ8K/Vi1rDbZYWWTdimin8LzdLjgT8nImZaxOJZsljmsjbGevsC0WqOyj49NWURoFrg6CpRWeNUbl05q@vger.kernel.org
X-Gm-Message-State: AOJu0YwMeI09QC1+g4r+k0mqqr4TmoKTgHgeq+jsBijEXmQONfVF0be1
	uW14uDqE2Va3lxMhIEFUH0zmZAjm/ILE+S7/OKn+CQ0/68TVWSTykoZkHO/E2BPkUmyVwHgPi93
	d+jtys5xVMHrqYFeOMOsTb2BllfXY0O3nIq77hfwe/tTLbFii3jJY2VcglzfgZUKG
X-Gm-Gg: AfdE7ck61y7+oXtOJErzhFLCQAQaVhLRacJPqZV48nWlCf0jya+j5LKEcbZ5+HIQOfX
	xcT/6z3QP+U8pIWnrMhOKPPO9S89dHnARdo8MlZOxhhLbzfIqYsyDOJYvMcIRbwB2YGXz5VE+9t
	ZBT2YnXpKYLk70w54fG7jgYCL+DfEG9deYXP9VgrnQ06P3ea0QBnHhAiVXFW6hNDV8CyLQX2DzW
	hmYqbQ3kb4EeT+E6wnsD5UK68HG4m7zCoN/NBf5rjBF4e+7pO9Q158ohASiEzzGRyuOBmXBOjmt
	MMcmnoYM8oKyBKlMxBfQkJKSZhSfhmL2DDhss/YHZdDsDhh3VMFRj793EgqSRPT1pggq0C5Cdf5
	xecUbDiXOSHc/yH/I7byctC+3J3wzTSIkKLv/hKtymum/HAad9Pu5uBn78GS0cg==
X-Received: by 2002:a05:620a:4504:b0:915:8502:f7fe with SMTP id af79cd13be357-92e781f1943mr80046585a.15.1782892242427;
        Wed, 01 Jul 2026 00:50:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4504:b0:915:8502:f7fe with SMTP id af79cd13be357-92e781f1943mr80042985a.15.1782892242042;
        Wed, 01 Jul 2026 00:50:42 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be82fd71sm77836705e9.15.2026.07.01.00.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 00:50:40 -0700 (PDT)
Message-ID: <b7922ba1-60f0-4135-8b86-e414c058a135@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 09:50:37 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] sparc: vdso: Respect COMPAT_32BIT_TIME
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
 <20260630-vdso-compat_32bit_time-v2-8-520d194640dd@linutronix.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260630-vdso-compat_32bit_time-v2-8-520d194640dd@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Xcw04kGfcEkugkGSj8HC7cQZCZv4Ca72
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfX9CVWCJ4PGaoR
 OWc7j/FuZGkIdsn8kDCYIdsqeeAQA53hzPgBDfCpHp1hO4jJZX9HadTjNL0iFGI+t7ad8Kl9VdA
 25TpCeYIgEGr040zgAr0+qcN3YZc2Gpy3KiGIF5SrfSBnDJQfsdcAG4uhanNc4rhIlMi2T+VeFD
 eY93gy6nMW+94y0gbuM6U7Qwu04Ngs7YAeLG0n+YaEse5Ag3kh0gkvn//BBDfVc+ayfYXSIvfhg
 pGNSA2OiXm6fuH2vSQ9eOdX6bLqihBBqNrNYpzSLtIyXnuOelOYXpjpXcZOxzhz3Cg42CICTb52
 CWebxx/ca7KqeNy0lcFdgGbgaWJyGtYDWnwuoDWr8JEKvxl0u5hCqbcDsW4Hh0vA1T+ESwdM9HF
 EDUupS6rCJEuitiBnMToC9i32Y8goqANE6knMgC9vWmI7G79sHdJech3qnVRu37pyjTPC9Uy6+I
 4tfKKDJltYxymXFtr1Q==
X-Proofpoint-ORIG-GUID: Xcw04kGfcEkugkGSj8HC7cQZCZv4Ca72
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44c6d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gC1PrsFcNpCBvASTUOwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NyBTYWx0ZWRfXy4S0wQ/LTAt4
 zI0VncPmis0ZQNmGXUfX7IMeDe/DZdnrUDZdHI1QaWWN4Xway4dlybazzRYfDRnlf7U1z8ebINa
 CXsLOdaZmiZi7UoFAON8p0b5REs0Qtc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-15381-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:jstultz@google.com,m:sboyd@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,m:arnd@arndb.de,m:linux-api@vger.kernel.org,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linutronix.de:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: 2530E6EAE17

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
>   arch/sparc/vdso/vclock_gettime.c    | 4 ++++
>   arch/sparc/vdso/vdso32/vdso32.lds.S | 6 ++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

