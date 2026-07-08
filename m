Return-Path: <linux-mips+bounces-15612-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PBMMChD0TWqAAgIAu9opvQ
	(envelope-from <linux-mips+bounces-15612-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 08:54:08 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB587225E8
	for <lists+linux-mips@lfdr.de>; Wed, 08 Jul 2026 08:54:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ibm.com header.s=pp1 header.b=J3VvRJOP;
	dmarc=pass (policy=none) header.from=ibm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15612-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15612-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D182B302D8DD
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2026 06:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4483EF66B;
	Wed,  8 Jul 2026 06:48:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D82F3ED13B;
	Wed,  8 Jul 2026 06:48:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493298; cv=none; b=b865xFRMMB5TgOOvhkQZRkYpt8JkJIpaIcQ3gXFlVrj6Q5f3Y0GMJX8dPQr2l1NRQO5t9oMGW1Xq588U5g6eIdpPs2JjTE7yzmSdsEaIxjqjrCxvz2cbwljd6hBYM4azZPuzD23/fNaLYpeyDh7STRFxJ2oxqs6BEutUJgnEjQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493298; c=relaxed/simple;
	bh=M28jEEiyxsmjSyjJRlntHZlI7gfJ2BDu8p/uyxAr2B4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qMX43TK75xG0bw9S5JxFK4WPZaDR4J0yDmWZ6pKJ257XC/hoUcO/vemFTJkZAEfobvOSYPHIW1+tqT8m0UEoj2s5WseBUIt1iziNzWy2UNTSRAVVEclSWUKPgumgDn2XgkSIhZW1pKK5+rQGgbZ/L1S5t06+3deku3C9YxmMBXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=J3VvRJOP; arc=none smtp.client-ip=148.163.156.1
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667MmZNI820082;
	Wed, 8 Jul 2026 06:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=5NHaxsIUhuT4+gPoK3v5GAm1W4gFqo
	zMGBzG5dhHB64=; b=J3VvRJOPVCo8sfswlNLclj5tEllTcDb/5mOo4UwrcEmwj9
	kOcib6SJfoOPHBqfKEFzjNZQd2EwJ57/yD6sG6B0H0tNDzXD0wPRsIJ0gKTgnWVA
	9JsrNlpGhEja0n+s390NL3qqR6LSh3vnBOyCGMWPrvuvLPrc+xg0eqGbCG9GpFQt
	T6IXomRuMHhJ8IUHLiU8SEMvKhLQvSru/L88QBvsa6uwMTaUt3hfk/CVTVbxikmA
	E2o0GDHMrGc6K06KjQtEHO/0pun9gVtSFIiO8WD/BwEDrzHsyEsZJRJzRzP90hSH
	1GPjR3pHagQg1Xr7sMrs+qCTC9VvOfizqWMYYnbA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sw4u21t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 06:47:19 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6686YexQ019843;
	Wed, 8 Jul 2026 06:47:18 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7eqg65y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 06:47:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6686lGMb12976422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jul 2026 06:47:16 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84BCD20049;
	Wed,  8 Jul 2026 06:47:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09F8D20040;
	Wed,  8 Jul 2026 06:47:16 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  8 Jul 2026 06:47:15 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra
 <peterz@infradead.org>, linux-s390@vger.kernel.org,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley
 <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        x86@kernel.org, Mark Rutland
 <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>,
        Andy
 Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        Richard
 Henderson <richard.henderson@linaro.org>,
        Russell King
 <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Guo
 Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard
 Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann
 <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon
 <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek
 <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller"
 <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        Michal =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 07/18] s390/syscall: Use
 enter_from_user_mode_randomize_stack()
In-Reply-To: <20260707190254.030598804@kernel.org>
References: <20260707181957.433213175@kernel.org>
	<20260707190254.030598804@kernel.org>
Date: Wed, 08 Jul 2026 08:47:15 +0200
Message-ID: <yt9d1pde6kr0.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: _L7edkq3BwnBWML6vUHeJ0rb1UtEu9CY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1OCBTYWx0ZWRfXy3LHxWa7PIH+
 8urugSBuUbrtJi57OI87IYjkuqIiXGOGFK+88q8gEVOe7ERBr8TsrVGypKfNgvFuShFuK5wtiHj
 Zfx4VvtSTJG9XBXaO4MYfRBFI5rBkjhHVxI5WzazNrE1rEbw178sbd/cxA6Auww+KIhdddwtejJ
 248bkWj12S+T6W3/mrf0LUiPVaXvbe32OIrqpAKj3jON8/Z4sW461FTCn6oauugcrSdf4ngCG9A
 Bjd+1hUZ81iR2MpsmkN2NtBwDJEQ+ZZf2mqghRWaGHeLLWTgm34cVk/vHeRpsZXUWFoQ1vYe+5X
 tbeYGoFzMCGLc9Qs5veIX8EC8xAv74iY/tqVUC8qt3d6EAvNIn5PzUFU1St8HVwn1XFeDmcRHny
 oEoQT+YS+miZuXlhWPhpBKCjMLxdBjJ9JOvWOsxszLTqO3yRBp31v2W/sChgHwIr1VV7XgJC5Cp
 eAQ5TpTCNimIS0W4vmA==
X-Proofpoint-ORIG-GUID: pEfjwvvoAjoHowG9Dv6PDIJZE3RmcFmr
X-Authority-Analysis: v=2.4 cv=FqQ1OWrq c=1 sm=1 tr=0 ts=6a4df278 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=buEBMWGfP5CXRQqppmAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1OCBTYWx0ZWRfX+R5HcxjXVv1w
 RVsRwLeD9F3N1eXzMOe+apX4IAesgta7GXGOixJqeU/NBHDn+tO8IhjIk+MU7dU+sY37T5/6W7w
 fxWFhXVc37deMYvOOlkRHjGNzgYwS7c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15612-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,kernel.org,lists.linux.dev,dabbelt.com,lists.infradead.org,arm.com,huawei.com,redhat.com,linaro.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,gmx.de,users.sourceforge.jp,nod.at,zankel.net,lists.linux-m68k.org,arndb.de,monstr.eu,davemloft.net,gaisler.com,suse.de,lwn.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:peterz@infradead.org,m:linux-s390@vger.kernel.org,m:mpe@ellerman.id.au,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kees@kernel.org,m:chenhuacai@kernel.org,m:loongarch@lists.linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:mark.rutland@arm.com,m:ruanjinjie@huawei.com,m:luto@kernel.org,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:guoren@kernel.org,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:deller@gmx.de,m:ysato@users.sourceforge.jp,m:richard@nod.at,m:chris@zankel.net,m:linux-arm-kernel@lists.infradead.org,m:linux-alpha@vger.kernel.org,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um@lists.infradead.org,m:arnd@arndb.de,m:vgupta@kernel.org,m:will@kernel.org,m:bcain@kernel.o
 rg,m:monstr@monstr.eu,m:dinguyen@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:linux-snps-arc@lists.infradead.org,m:linux-hexagon@vger.kernel.org,m:linux-openrisc@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-arch@vger.kernel.org,m:msuchanek@suse.de,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[svens@linux.ibm.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[svens@linux.ibm.com,linux-mips@vger.kernel.org];
	RCPT_COUNT_GT_50(0.00)[52];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,linux.ibm.com:from_mime,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BB587225E8

Thomas Gleixner <tglx@kernel.org> writes:

> enter_from_user_mode_randomize_stack() replaces enter_from_user_mode() and
> the subsequent invocation of add_random_kstack_offset_irqsoff().
>
> As a bonus this avoids the overhead of get/put_cpu_var() in
> add_random_kstack_offset().
>
> No functional change.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org
> ---
>  arch/s390/kernel/syscall.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --- a/arch/s390/kernel/syscall.c
> +++ b/arch/s390/kernel/syscall.c
> @@ -97,8 +97,8 @@ void noinstr __do_syscall(struct pt_regs
>  {
>  	unsigned long nr;
>  
> -	enter_from_user_mode(regs);
> -	add_random_kstack_offset();
> +	enter_from_user_mode_randomize_stack(regs);
> +
>  	regs->psw = get_lowcore()->svc_old_psw;
>  	regs->int_code = get_lowcore()->svc_int_code;
>  	update_timer_sys();

Reviewed-by: Sven Schnelle <svens@linux.ibm.com>

