Return-Path: <linux-mips+bounces-15611-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AHtNHNDeTWqc/QEAu9opvQ
	(envelope-from <linux-mips+bounces-15611-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 07:23:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 869FB721C56
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 07:23:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ibm.com header.s=pp1 header.b=ZZqQNPhk;
	dmarc=pass (policy=none) header.from=ibm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15611-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15611-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9CE5D30069BE
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2026 05:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71FE3B8D4A;
	Wed,  8 Jul 2026 05:23:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DD3282F22;
	Wed,  8 Jul 2026 05:23:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488200; cv=none; b=kv8XWVu6yCSZNH3K+ZswZxYLxxVIn+hWHhuScBWB+o1GylEzj+FAWY0x0lk1O907Jz9vjHxctKIIQ8gVeNrtelrXBt2dmBFlqDMUPTovntKglwCpcpFv4GOLNvmxu62FdcGaMS7fibyRghN8OizMbmQASfc0a8XG/wfd8tsb6Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488200; c=relaxed/simple;
	bh=ExM+fZ6EJSEWyjjL+xv265El/Vf9MSkDDAu1qw5DkY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3oT+E2hPdOLuyZuOnyQ1Q1+VUyiQWFE8adU3rF+PCZ7rwSGP19NhnyjUn6kf+KrtrJJPRYOAmftVQ19qv8SSaTzBP8uV2BlpQow1w5l20XmHNx3yUYAc31bhCKnHaHQ3ewSDe3ef8ylXUTnwGdaKPHiOSpG5PElB2hSzQsjCxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ZZqQNPhk; arc=none smtp.client-ip=148.163.156.1
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667MoCDb1241058;
	Wed, 8 Jul 2026 05:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=tll43y
	MYY0gJ41t0dJiFvN1H8Iwn7NXT9TSlqK6+a0I=; b=ZZqQNPhkXTyj6VYfTJAmLU
	Q2IYtxQjdssn+KKNKVFZKADMsx2KASHPKsuys4hvQvXkULDxpVG9rA3BdMT35e0G
	jbnBJRSM9mCqT8ANlz0KSs0S7rmuHMSx4F0LqC56ivvPdtxpUPGC9yWXIP/OXr7f
	BeGJLa/A2agWiO2F93bL2hcxR4PgKJUeJr5ZheJfNGNWlEAyR1QcnPDMXzzyYrRa
	A73gQktl/DFlF/292aG/5zOdUU818PHk7Sdmm6kg5DNLkgGx6t2O1+pDRN3le4Rj
	vViRZeGzgfU+gadMlpLFlChbKEsXs3/AgDAcjmV0FFZABDK4/LWdudY20k2e7QIA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6suqtf50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 05:22:13 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6685JaAI023848;
	Wed, 8 Jul 2026 05:22:12 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7cvw688b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 05:22:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6685MAp260621196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jul 2026 05:22:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 054282006A;
	Wed,  8 Jul 2026 05:22:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0F7D2004E;
	Wed,  8 Jul 2026 05:21:57 +0000 (GMT)
Received: from [9.39.26.208] (unknown [9.39.26.208])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jul 2026 05:21:57 +0000 (GMT)
Message-ID: <5c202ab4-33f1-42e9-bef2-81fbd0a9992e@linux.ibm.com>
Date: Wed, 8 Jul 2026 10:51:56 +0530
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 18/18] entry, treewide: Make
 syscall_enter_from_user_mode[_work]() indicate syscall execution
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        =?UTF-8?Q?Michal_Such=C3=A1nek?=
 <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Sven Schnelle <svens@linux.ibm.com>, linux-doc@vger.kernel.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        Kees Cook <kees@kernel.org>, x86@kernel.org,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
        Brian Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190254.603111179@kernel.org>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20260707190254.603111179@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA0OCBTYWx0ZWRfXxSl7x3k5a6ei
 QA/9ovMKT7kdl6M9nhJHPiU5Va+0SMH1n5p6faKMOLNK2IP4f7O9yRlZqmDsX+cRLOwaczJkYu6
 YFFs6lYoe56Q5OC89jMbNKtlTg1sYfQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA0OCBTYWx0ZWRfX3ydylQJ4fTVr
 yzJdJoQRGFJYVNXH4tJtwPXgvXCNNj6TB1mULNmX67YHEsNwsYZ+zWuGyLYgPleHJn3iI+MePRc
 8qWnjG+R9YNa3qkIzyy4gaMocR7IFhoOLPAPNNC6L5iWFEqrG7XTMMEcN3raaxnprWDVUq+bgpU
 5wrLLxOOo6YW/NTAtV86y9SO3ET0EB4cqODiD6K9rvrruT3Qa0qv0J9XKmoL/eh4SOiexsuTJOE
 lBbBSlLZwVDt1FCwXnfcaA5VZw8uwdeT1uMWCVKUIXtx1i4h62DeziOwh3lWpUlqJ7jEqZftcgm
 3GHa7WSGEIazY62fE5EwnX9azBN3bF3r1Ik2UT+XUwzeHqz6O9hmtEHm5KY5fODirBFCZCT2O7j
 FDgYAmi2eYrAgAXEBXXjj4CDE/0oMsM4aP/wEOp7D/MfBYKao1VhzY1WkyQLmAVOENVRaCpVN/c
 RrliXM3PpYaZC4QbPFA==
X-Proofpoint-GUID: vvog-gPYguN7EhC60dEKeTKihSlYDK1F
X-Authority-Analysis: v=2.4 cv=Oot/DS/t c=1 sm=1 tr=0 ts=6a4dde86 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=07d9gI8wAAAA:8 a=7CQSdrXTAAAA:8 a=VnNF1IyMAAAA:8 a=_O3DOGVWAAAA:8
 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8 a=AXw8nYVqL9ZZMf_T3-MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=e2CUPOnPG4QKp8I52DXD:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=2TKV-7w1aU1AVAwN0oqT:22 a=IC2XNlieTeVoXbcui8wp:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: RkzOcMMYINu4PtirGgtJlsZtJe4Gxl4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080048
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[infradead.org,suse.de,lwn.net,arndb.de,arm.com,kernel.org,ellerman.id.au,dabbelt.com,linux.ibm.com,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,monstr.eu,davemloft.net,gaisler.com];
	TAGGED_FROM(0.00)[bounces-15611-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:arnd@arndb.de,m:mark.rutland@arm.com,m:chenhuacai@kernel.org,m:mpe@ellerman.id.au,m:pjw@kernel.org,m:palmer@dabbelt.com,m:svens@linux.ibm.com,m:linux-doc@vger.kernel.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:kees@kernel.org,m:x86@kernel.org,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infra
 dead.org,m:vgupta@kernel.org,m:will@kernel.org,m:bcain@kernel.org,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[52];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 869FB721C56

Hi Thomas.

On 7/8/26 12:37 AM, Thomas Gleixner wrote:
> From: Michal Suchánek <msuchanek@suse.de>
> 
> The return values of syscall_enter_from_user_mode[_work]() are
> non-intuitive. Both functions return the syscall number which should be
> invoked by the architecture specific syscall entry code. The returned
> number can be:
> 
>    - the unmodified syscall number which was handed in by the caller
> 
>    - a modified syscall number (ptrace, seccomp, trace/probe/bpf)
> 
> That has an additional twist. If the return value is -1L then the caller is
> not allowed to modify the return value as that indicates that the modifying
> entity requests to abort the syscall and set the return value already. That
> can obviously not be differentiated from a syscall which handed in -1 as
> syscall number.
> 
> The established way to deal with that is:
> 
>      set_return_value(regs, -ENOSYS);
>      nr = syscall_enter_from_user_mode(regs, nr);
>      if ((unsigned)nr < SYSCALLNR_MAX)
>      	handle_syscall(regs, nr);
>      else if (nr != -1)
>      	set_return_value(regs, -ENOSYS);
> 
> The latter is obviously redundant, but that's just a leftover of the
> historical evolution of this code. S390 has some special requirements here,
> which can be avoided when the return value is not ambiguous.
> 
> Now that the functions which modify the syscall number and want to abort
> are converted to indicate that with a boolean return value, it's obvious to
> hand this through to the callers.
> 
> Rework syscall_enter_from_user_mode[_work]) so they take a pointer to the
> syscall number and return a boolean, which indicates whether the syscall
> should be handled or not.
> 
> That's not only more intuitive, it also results in slightly denser
> executable code on x86 at least, but perf results are neutral and within
> the noise.
> 
> [ tglx: Adopted it to the changes in the generic entry code, fixed up the
>    	32-bit fallout and rewrote change log ]
> 
> Signed-off-by: Michal Suchánek <msuchanek@suse.de>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: linux-doc@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> ---
>   Documentation/core-api/entry.rst |   18 +++++++++++-------
>   arch/loongarch/kernel/syscall.c  |   14 +++++++-------
>   arch/powerpc/kernel/syscall.c    |    3 ++-
>   arch/riscv/kernel/traps.c        |   11 +++++------
>   arch/s390/kernel/syscall.c       |    7 +++++--
>   arch/x86/entry/syscall_32.c      |   25 ++++++++++++-------------
>   arch/x86/entry/syscall_64.c      |   12 ++++++------
>   include/linux/entry-common.h     |   12 +++++-------
>   8 files changed, 53 insertions(+), 49 deletions(-)
> 
> --- a/Documentation/core-api/entry.rst
> +++ b/Documentation/core-api/entry.rst
> @@ -68,16 +68,20 @@ low-level C code must not be instrumente
>     noinstr void syscall(struct pt_regs *regs, int nr)
>     {
>   	arch_syscall_enter(regs);
> -	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
> -
> -	instrumentation_begin();
> -	if (!invoke_syscall(regs, nr) && nr != -1)
> -	 	result_reg(regs) = __sys_ni_syscall(regs);
> -	instrumentation_end();
> -
> +	result_reg(regs) = -ENOSYS;
> +	if (syscall_enter_from_user_mode_randomize_stack(regs, &nr)) {
> +		instrumentation_begin();
> +		if (!invoke_syscall(regs, nr))
> +			result_reg(regs) = __sys_ni_syscall(regs);
> +		instrumentation_end();
> +	}
>   	syscall_exit_to_user_mode(regs);
>     }
>   
> +It is required that either the low level assembly code or the syscall
> +function sets the result register to -ENOSYS before invoking the generic
> +code.
> +
>   syscall_enter_from_user_mode_randomize_stack() first invokes
>   enter_from_user_mode_randomize_stack() which establishes state in the
>   following order:
> --- a/arch/loongarch/kernel/syscall.c
> +++ b/arch/loongarch/kernel/syscall.c
> @@ -57,8 +57,8 @@ typedef long (*sys_call_fn)(unsigned lon
>   
>   void noinstr __no_stack_protector do_syscall(struct pt_regs *regs)
>   {
> -	unsigned long nr;
>   	sys_call_fn syscall_fn;
> +	unsigned long nr;
>   
>   	nr = regs->regs[11];
>   	/* Set for syscall restarting */
> @@ -69,12 +69,12 @@ void noinstr __no_stack_protector do_sys
>   	regs->orig_a0 = regs->regs[4];
>   	regs->regs[4] = -ENOSYS;
>   
> -	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
> -
> -	if (nr < NR_syscalls) {
> -		syscall_fn = sys_call_table[array_index_nospec(nr, NR_syscalls)];
> -		regs->regs[4] = syscall_fn(regs->orig_a0, regs->regs[5], regs->regs[6],
> -					   regs->regs[7], regs->regs[8], regs->regs[9]);
> +	if (likely(syscall_enter_from_user_mode_randomize_stack(regs, &nr))) {
> +		if (nr < NR_syscalls) {
> +			syscall_fn = sys_call_table[array_index_nospec(nr, NR_syscalls)];
> +			regs->regs[4] = syscall_fn(regs->orig_a0, regs->regs[5], regs->regs[6],
> +						   regs->regs[7], regs->regs[8], regs->regs[9]);
> +		}
>   	}
>   
>   	syscall_exit_to_user_mode(regs);
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -18,7 +18,8 @@ notrace long system_call_exception(struc
>   	long ret;
>   	syscall_fn f;
>   
> -	r0 = syscall_enter_from_user_mode_randomize_stack(regs, r0);
> +	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))
> +		return syscall_get_error(current, regs);
>   

There is one missing )

diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index d85894bdb6a2..1440dcabe052 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -18,7 +18,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
         long ret;
         syscall_fn f;
  
-       if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))
+       if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0)))
                 return syscall_get_error(current, regs);
  
         if (unlikely(r0 >= NR_syscalls)) {


>   	if (unlikely(r0 >= NR_syscalls)) {
>   		if (unlikely(trap_is_unsupported_scv(regs))) {
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -332,13 +332,12 @@ void do_trap_ecall_u(struct pt_regs *reg
>   
>   		riscv_v_vstate_discard(regs);
>   
> -		syscall = syscall_enter_from_user_mode_randomize_stack(regs, syscall);
> -
> -		if (syscall >= 0 && syscall < NR_syscalls) {
> -			syscall = array_index_nospec(syscall, NR_syscalls);
> -			syscall_handler(regs, syscall);
> +		if (syscall_enter_from_user_mode_randomize_stack(regs, &syscall)) {
> +			if (syscall >= 0 && syscall < NR_syscalls) {
> +				syscall = array_index_nospec(syscall, NR_syscalls);
> +				syscall_handler(regs, syscall);
> +			}
>   		}
> -
>   		syscall_exit_to_user_mode(regs);
>   	} else {
>   		irqentry_state_t state = irqentry_nmi_enter(regs);
> --- a/arch/s390/kernel/syscall.c
> +++ b/arch/s390/kernel/syscall.c
> @@ -96,6 +96,7 @@ SYSCALL_DEFINE0(ni_syscall)
>   void noinstr __do_syscall(struct pt_regs *regs, int per_trap)
>   {
>   	unsigned long nr;
> +	bool permit;
>   
>   	enter_from_user_mode_randomize_stack(regs);
>   
> @@ -121,7 +122,9 @@ void noinstr __do_syscall(struct pt_regs
>   		regs->psw.addr = current->restart_block.arch_data;
>   		current->restart_block.arch_data = 1;
>   	}
> -	nr = syscall_enter_from_user_mode_work(regs, nr);
> +
> +	permit = syscall_enter_from_user_mode_work(regs, &nr);
> +
>   	/*
>   	 * In the s390 ptrace ABI, both the syscall number and the return value
>   	 * use gpr2. However, userspace puts the syscall number either in the
> @@ -129,7 +132,7 @@ void noinstr __do_syscall(struct pt_regs
>   	 * work, the ptrace code sets PIF_SYSCALL_RET_SET, which is checked here
>   	 * and if set, the syscall will be skipped.
>   	 */
> -	if (unlikely(test_and_clear_pt_regs_flag(regs, PIF_SYSCALL_RET_SET)))
> +	if (unlikely(test_and_clear_pt_regs_flag(regs, PIF_SYSCALL_RET_SET) || !permit))
>   		goto out;
>   	regs->gprs[2] = -ENOSYS;
>   	if (likely(nr < NR_syscalls)) {
> --- a/arch/x86/entry/syscall_32.c
> +++ b/arch/x86/entry/syscall_32.c
> @@ -161,8 +161,9 @@ static __always_inline bool int80_is_ext
>   	nr = syscall_32_enter(regs);
>   
>   	local_irq_enable();
> -	nr = syscall_enter_from_user_mode_work(regs, nr);
> -	do_syscall_32_irqs_on(regs, nr);
> +
> +	if (likely(syscall_enter_from_user_mode_work(regs, &nr)))
> +		do_syscall_32_irqs_on(regs, nr);
>   
>   	instrumentation_end();
>   	syscall_exit_to_user_mode(regs);
> @@ -223,8 +224,8 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
>   	nr = syscall_32_enter(regs);
>   
>   	local_irq_enable();
> -	nr = syscall_enter_from_user_mode_work(regs, nr);
> -	do_syscall_32_irqs_on(regs, nr);
> +	if (likely(syscall_enter_from_user_mode_work(regs, &nr)))
> +		do_syscall_32_irqs_on(regs, nr);
>   
>   	instrumentation_end();
>   	syscall_exit_to_user_mode(regs);
> @@ -243,13 +244,13 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
>   	 * orig_ax, the int return value truncates it. This matches
>   	 * the semantics of syscall_get_nr().
>   	 */
> -	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
> -
> -	instrumentation_begin();
> +	if (likely(syscall_enter_from_user_mode_randomize_stack(regs, &nr))) {
> +		instrumentation_begin();
>   
> -	do_syscall_32_irqs_on(regs, nr);
> +		do_syscall_32_irqs_on(regs, nr);
>   
> -	instrumentation_end();
> +		instrumentation_end();
> +	}
>   	syscall_exit_to_user_mode(regs);
>   }
>   #endif /* !CONFIG_IA32_EMULATION */
> @@ -286,10 +287,8 @@ static noinstr bool __do_fast_syscall_32
>   		return false;
>   	}
>   
> -	nr = syscall_enter_from_user_mode_work(regs, nr);
> -
> -	/* Now this is just like a normal syscall. */
> -	do_syscall_32_irqs_on(regs, nr);
> +	if (likely(syscall_enter_from_user_mode_work(regs, &nr)))
> +		do_syscall_32_irqs_on(regs, nr);
>   
>   	instrumentation_end();
>   	syscall_exit_to_user_mode(regs);
> --- a/arch/x86/entry/syscall_64.c
> +++ b/arch/x86/entry/syscall_64.c
> @@ -78,14 +78,14 @@ static __always_inline void do_syscall_x
>   /* Returns true to return using SYSRET, or false to use IRET */
>   __visible noinstr bool do_syscall_64(struct pt_regs *regs, long nr)
>   {
> -	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
> +	if (likely(syscall_enter_from_user_mode_randomize_stack(regs, &nr))) {
> +		instrumentation_begin();
>   
> -	instrumentation_begin();
> +		if (!do_syscall_x64(regs, nr))
> +			do_syscall_x32(regs, nr);
>   
> -	if (!do_syscall_x64(regs, nr))
> -		do_syscall_x32(regs, nr);
> -
> -	instrumentation_end();
> +		instrumentation_end();
> +	}
>   	syscall_exit_to_user_mode(regs);
>   
>   	/*
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -71,7 +71,7 @@ static inline void syscall_enter_audit(s
>   	}
>   }
>   
> -static __always_inline bool syscall_trace_enter(struct pt_regs *regs, unsigned long work,
> +static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work,
>   						long *syscall)
>   {
>   	/*
> @@ -141,16 +141,14 @@ static __always_inline bool syscall_trac
>    *     ptrace_report_syscall_permit_entry(), __seccomp_permit_syscall(), trace_sys_enter()
>    *  2) Invocation of audit_syscall_entry()
>    */
> -static __always_inline long syscall_enter_from_user_mode_work(struct pt_regs *regs, long syscall)
> +static __always_inline bool syscall_enter_from_user_mode_work(struct pt_regs *regs, long *syscall)
>   {
>   	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
>   
> -	if (work & SYSCALL_WORK_ENTER) {
> -		if (!syscall_trace_enter(regs, work, &syscall))
> -			return -1L;
> -	}
> +	if (unlikely(work & SYSCALL_WORK_ENTER))
> +		return syscall_trace_enter(regs, work, syscall);
>   
> -	return syscall;
> +	return true;
>   }
>   
>   /**
> 


