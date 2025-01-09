Return-Path: <linux-mips+bounces-7324-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C2DA07E90
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 18:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF0821682B9
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 17:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCF216FF4E;
	Thu,  9 Jan 2025 17:17:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8D718FC9F;
	Thu,  9 Jan 2025 17:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736443043; cv=none; b=OLEU6iteInoWRJX8Uz11wDGAHDwe2BeN5oWauIIcC58FXy0TKlFI0j3d+30FsHcjw9zSlOFluddX42g6P8W9JUQGTn7PJC79n/epGhVoFb5m6y0syj929aCbhLuYnqZt1vIeZnWx3422aUBtCSNN48X0ekZ7x/l3Gc3PduTPJuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736443043; c=relaxed/simple;
	bh=PLRfBxzx8MW+nzx9YNnXGbnF6eGnvXEOrU2I8TmY5jE=;
	h=From:To:Cc:References:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:Subject; b=lYlT/p6TCkAhqi88WPhdR36ZDjsQLGalz4IHVxtm99TeZ+moKWGt97g3O/rJs+rjHld2OtZwVNR62/MjfewgS0LNyE5XZm8CTDK7H0QIDTiV1sNGTDC92H0aSHI6OB03nT8Gb+f+mrFtKb8KkcCX2ufqZTmyde2+zlbgxsFYi90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in02.mta.xmission.com ([166.70.13.52]:33594)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1tVw9l-004RzC-Sg; Thu, 09 Jan 2025 10:17:17 -0700
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:57960 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1tVw9k-00FJDS-N8; Thu, 09 Jan 2025 10:17:17 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,  "Richard
 Henderson" <richard.henderson@linaro.org>,  "Matt Turner"
 <mattst88@gmail.com>,  "Kees Cook" <kees@kernel.org>,  "Paul E. McKenney"
 <paulmck@kernel.org>,  linux-alpha@vger.kernel.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  "Michael Cree" <mcree@orcon.net.nz>,  "Sam
 James" <sam@gentoo.org>,  "Maciej W. Rozycki" <macro@orcam.me.uk>,  "Geert
 Uytterhoeven" <geert@linux-m68k.org>,  "Michael Karcher"
 <kernel@mkarcher.dialup.fu-berlin.de>,  "Chris Hofstaedtler"
 <zeha@debian.org>,  util-linux@vger.kernel.org,
  linux-mips@vger.kernel.org,  loongarch@lists.linux.dev
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
	<24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
	<678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
	<bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
	<82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
	<cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
	<87ed1cufj1.fsf@email.froward.int.ebiederm.org>
	<9b1749f0-e936-4bf5-90d6-8cf15e4f0ed9@app.fastmail.com>
Date: Thu, 09 Jan 2025 11:17:09 -0600
In-Reply-To: <9b1749f0-e936-4bf5-90d6-8cf15e4f0ed9@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 09 Jan 2025 17:52:18 +0100")
Message-ID: <87tta7uctm.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1tVw9k-00FJDS-N8;;;mid=<87tta7uctm.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1/xDtOyVhked4noljI67FlrAtmm9M6NllY=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4969]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;"Arnd Bergmann" <arnd@arndb.de>
X-Spam-Relay-Country: 
X-Spam-Timing: total 572 ms - load_scoreonly_sql: 0.05 (0.0%),
	signal_user_changed: 10 (1.7%), b_tie_ro: 9 (1.5%), parse: 1.02 (0.2%),
	 extract_message_metadata: 16 (2.9%), get_uri_detail_list: 2.9 (0.5%),
	tests_pri_-2000: 22 (3.8%), tests_pri_-1000: 3.2 (0.6%),
	tests_pri_-950: 1.17 (0.2%), tests_pri_-900: 1.00 (0.2%),
	tests_pri_-90: 77 (13.4%), check_bayes: 75 (13.2%), b_tokenize: 12
	(2.1%), b_tok_get_all: 11 (1.9%), b_comp_prob: 3.3 (0.6%),
	b_tok_touch_all: 46 (8.1%), b_finish: 0.71 (0.1%), tests_pri_0: 427
	(74.7%), check_dkim_signature: 0.57 (0.1%), check_dkim_adsp: 2.5
	(0.4%), poll_dns_idle: 0.81 (0.1%), tests_pri_10: 2.1 (0.4%),
	tests_pri_500: 8 (1.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] alpha: Fix personality flag propagation across an exec
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: loongarch@lists.linux.dev, linux-mips@vger.kernel.org, util-linux@vger.kernel.org, zeha@debian.org, kernel@mkarcher.dialup.fu-berlin.de, geert@linux-m68k.org, macro@orcam.me.uk, sam@gentoo.org, mcree@orcon.net.nz, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, paulmck@kernel.org, kees@kernel.org, mattst88@gmail.com, richard.henderson@linaro.org, glaubitz@physik.fu-berlin.de, arnd@arndb.de
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out03.mta.xmission.com); SAEximRunCond expanded to false

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Thu, Jan 9, 2025, at 17:18, Eric W. Biederman wrote:
>> John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> writes:
>>> On Thu, 2025-01-09 at 09:56 +0100, Arnd Bergmann wrote:
>>>> On Thu, Jan 9, 2025, at 09:46, John Paul Adrian Glaubitz wrote:
>>>> > On Thu, 2025-01-09 at 09:43 +0100, Arnd Bergmann wrote:
>>>> > > On Thu, Jan 9, 2025, at 09:01, Arnd Bergmann wrote:
>>>> > > > This looks wrong to me: since ADDR_LIMIT_32BIT is not part of
>>>> > > > PER_MASK, executing a regular binary from a taso binary no longer
>>>> > > > reverts back to the entire 64-bit address space.
>>>> > > > 
>>>> > > > It seems that the behavior on most other architectures changed in 2012
>>>> > > > commit 16f3e95b3209 ("cross-arch: don't corrupt personality flags upon
>>>> > > > exec()").
>>>> > > > 
>>>> > 
>>>> > So, if I understand this correctly, we should just use PER_MASK on alpha
>>>> > for 64-bit executables and allow the bits to be cleared for 32-bit binaries?
>>>> 
>>>> I think ideally the EF_ALPHA_32BIT handling should use TIF_32BIT
>>>> as we do on other architectures, at that point the custom SET_PERSONALITY()
>>>> can be removed in favor of the asm-generic version.
>>>
>>> I have thought about that as well but I wasn't sure whether the extra
>>> mangling on alpha was necessary.
>>>
>>>> Alternatively this could do something like the arm32 version (note
>>>> that on arm, PER_LINUX_32BIT/ADDR_LIMIT_32BIT means "allow using
>>>> the entire 32-bit address space rather than limiting to 26 bits for
>>>> compatibility", while on alpha it means "use only 31 instead of
>>>> 42 bits for addressing", but the logic can be the same):
>>>> 
>>>>         unsigned int personality = current->personality & ~PER_MASK;
>>>>         /*
>>>>          * APCS-26 is only valid for OABI executables
>>>>          */
>>>>         if ((eflags & EF_ARM_EABI_MASK) == EF_ARM_EABI_UNKNOWN &&
>>>>             (eflags & EF_ARM_APCS_26))
>>>>                 personality &= ~ADDR_LIMIT_32BIT;
>>>>         else
>>>>                 personality |= ADDR_LIMIT_32BIT;
>>>>         set_personality(personality);
>>>
>>> So, this would be the 100% correct for alpha then which would not loose
>>> any functionality even for 32-bit binaries?
>>
>> I don't think it is correct to think about 32-bit binaries on alpha.
>>
>> Alpha never had a 32bit instruction set.  But at some point it looks
>> like binaries that could not handle more than 31 bits of address
>> space got ported and someone implemented a work-around.  I guess this
>> is the --taso option that Arnd mentioned.
>
> There was a well-documented use case for taso with emulation for
> OSF/1 a.out binaries, in particular Netscape used 32-bit pointers.
> However, the a.out support got removed a while back, and I have
> not figured out why it was ever added for ELF. Maybe it was just
> easy to duplicate this from the a.out loader?

It looks too well done to be just a duplication from the a.out loader.
Possibly OSF/1 was duplicating it from their a.out loader.

> Obviously some 30 years ago it was common that software was
> broken on 64-bit because of invalid integer-pointer casting,
> but these days, it's much more common to be broken on 32-bit
> instead.

Agreed.

>> I think the alpha version would look like:
>>
>> #define SET_PERSONALITY(ex) 							\
>> 	do {									\
>> 		unsigned long personality = current->personality & ~PER_MASK;	\
>>                 if ((EX).e_flags & EF_ALPHA_32BIT)				\
>>                 	personality |= ADDR_LIMIT_32BIT;			\
>> 		else								\
>>                 	personality &= ~ADDR_LIMIT_32BIT			\
>> 		set_personality(personality);					\
>> 	while (0)
>
> Yes, that was what I was suggesting.
>
>> I do see code under arch/alpha/ testing ADDR_LIMIT_32BIT when
>> setting STACK_TOP, TASK_UNMAPPED_BASE, and arch_get_unmapped_area.
>> So I think the code still works.
>
> MIPS introduced the SET_PERSONALITY2() macro specifically to
> allow the TIF flags to be set early enough to apply to the
> stack allocation, so I suspect it only works partially.

If you are in the personality flag you don't have the concern about
things being set early enough.  So I don't see anything that screams
this code is broken.

On the flip side if no one can think of any binaries that have that
EF_ALPHA_32BIT set in e_flags, it is totally reasonable to remove the
support from alpha and just have arch_check_elf fail (loudly) if such a
binary is encountered.  Then if someone cares the code can be added back
in.

Just removing the code is probably the easiest thing to do for long term
maintenance.  As then we are just maintaining the code people are using.

Eric

