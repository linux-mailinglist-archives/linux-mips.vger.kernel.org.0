Return-Path: <linux-mips+bounces-7325-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38908A07E99
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 18:19:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D76EA3A0878
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 17:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA7E18DF73;
	Thu,  9 Jan 2025 17:18:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF3316FF4E;
	Thu,  9 Jan 2025 17:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736443139; cv=none; b=M/BuJvnFIJEU/gt7BnQ7yiyrRlpcG/Fe3XKKqNmGvYBhIZMuPCsvEix0ENY21L+b1zzdVSRm0NXpndn+x8tSKPTpEhhxeMZ3gOP9WxaBMGjaHSgvpMKKZoNSgUJSMFh+ZOj/tW4Of3LNEixbRpduP0OIW9b8k8LLZK1HIseZOTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736443139; c=relaxed/simple;
	bh=c3KFw1+LsOlciwY+NMCganNx4nwzra5bRGq7SIrHnsY=;
	h=From:To:Cc:References:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:Subject; b=Z4+pA3mU2ha6VD0+Q1lnqRQKEFpoc5sxCqD1G5/2Ueh7wp3cHXYJpg3urR8OO6/4Ugiz1xFrmBkaf9jog4KKMsFdyGg0dx1jG/h9YndIvy8hufR+awNRqX/CWxauVgUO8KiNlYAhi+eomj/OYVxSN+IwWeDJD4Mym4UlsCdCKy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in01.mta.xmission.com ([166.70.13.51]:59428)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1tVvG6-004LZS-Rm; Thu, 09 Jan 2025 09:19:46 -0700
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:44194 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1tVvG5-009qdf-JI; Thu, 09 Jan 2025 09:19:46 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Arnd Bergmann <arnd@arndb.de>,  Richard Henderson
 <richard.henderson@linaro.org>,  Matt Turner <mattst88@gmail.com>,  Kees
 Cook <kees@kernel.org>,  "Paul E. McKenney" <paulmck@kernel.org>,
  linux-alpha@vger.kernel.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  Michael Cree <mcree@orcon.net.nz>,  Sam
 James <sam@gentoo.org>,  "Maciej W. Rozycki" <macro@orcam.me.uk>,  Geert
 Uytterhoeven <geert@linux-m68k.org>,  Michael Karcher
 <kernel@mkarcher.dialup.fu-berlin.de>,  Chris Hofstaedtler
 <zeha@debian.org>,  util-linux@vger.kernel.org,
  linux-mips@vger.kernel.org,  loongarch@lists.linux.dev
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
	<24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
	<678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
	<bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
	<82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
	<cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
Date: Thu, 09 Jan 2025 10:18:42 -0600
In-Reply-To: <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
	(John Paul Adrian Glaubitz's message of "Thu, 09 Jan 2025 10:12:03
	+0100")
Message-ID: <87ed1cufj1.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1tVvG5-009qdf-JI;;;mid=<87ed1cufj1.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX19rKnAbYTd2HzCFmMonoQpOugPKZhwJLI8=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4879]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa04 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa04 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Spam-Relay-Country: 
X-Spam-Timing: total 637 ms - load_scoreonly_sql: 0.06 (0.0%),
	signal_user_changed: 13 (2.0%), b_tie_ro: 11 (1.7%), parse: 1.76
	(0.3%), extract_message_metadata: 21 (3.3%), get_uri_detail_list: 4.9
	(0.8%), tests_pri_-2000: 19 (3.0%), tests_pri_-1000: 4.3 (0.7%),
	tests_pri_-950: 1.59 (0.3%), tests_pri_-900: 1.29 (0.2%),
	tests_pri_-90: 114 (18.0%), check_bayes: 111 (17.4%), b_tokenize: 15
	(2.3%), b_tok_get_all: 24 (3.8%), b_comp_prob: 4.0 (0.6%),
	b_tok_touch_all: 63 (9.9%), b_finish: 1.04 (0.2%), tests_pri_0: 446
	(70.0%), check_dkim_signature: 0.59 (0.1%), check_dkim_adsp: 3.5
	(0.6%), poll_dns_idle: 0.03 (0.0%), tests_pri_10: 2.2 (0.3%),
	tests_pri_500: 7 (1.1%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] alpha: Fix personality flag propagation across an exec
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: loongarch@lists.linux.dev, linux-mips@vger.kernel.org, util-linux@vger.kernel.org, zeha@debian.org, kernel@mkarcher.dialup.fu-berlin.de, geert@linux-m68k.org, macro@orcam.me.uk, sam@gentoo.org, mcree@orcon.net.nz, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, paulmck@kernel.org, kees@kernel.org, mattst88@gmail.com, richard.henderson@linaro.org, arnd@arndb.de, glaubitz@physik.fu-berlin.de
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out03.mta.xmission.com); SAEximRunCond expanded to false

John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> writes:

> Hi Arnd,
>
> On Thu, 2025-01-09 at 09:56 +0100, Arnd Bergmann wrote:
>> On Thu, Jan 9, 2025, at 09:46, John Paul Adrian Glaubitz wrote:
>> > On Thu, 2025-01-09 at 09:43 +0100, Arnd Bergmann wrote:
>> > > On Thu, Jan 9, 2025, at 09:01, Arnd Bergmann wrote:
>> > > > On Fri, Jan 3, 2025, at 15:01, John Paul Adrian Glaubitz wrote:
>> > > > 
>> > > > > 
>> > > > >  #define SET_PERSONALITY(EX)					\
>> > > > > -	set_personality(((EX).e_flags & EF_ALPHA_32BIT)		\
>> > > > > -	   ? PER_LINUX_32BIT : PER_LINUX)
>> > > > > +	set_personality((((EX).e_flags & EF_ALPHA_32BIT)	\
>> > > > > +	   ? PER_LINUX_32BIT : PER_LINUX) | (current->personality & (~PER_MASK)))

*Grumble*

It would be good to move those EF_${ARCH} flags from
arch/${ARCH}/include/asm/elf.h to arch/${ARCH}/include/uapi/asm/elf.h

Simply because those flags are architecture specific ABI.

>> > > > This looks wrong to me: since ADDR_LIMIT_32BIT is not part of
>> > > > PER_MASK, executing a regular binary from a taso binary no longer
>> > > > reverts back to the entire 64-bit address space.
>> > > > 
>> > > > It seems that the behavior on most other architectures changed in 2012
>> > > > commit 16f3e95b3209 ("cross-arch: don't corrupt personality flags upon
>> > > > exec()").
>> > > > 
>> > 
>> > So, if I understand this correctly, we should just use PER_MASK on alpha
>> > for 64-bit executables and allow the bits to be cleared for 32-bit binaries?
>> 
>> I think ideally the EF_ALPHA_32BIT handling should use TIF_32BIT
>> as we do on other architectures, at that point the custom SET_PERSONALITY()
>> can be removed in favor of the asm-generic version.
>
> I have thought about that as well but I wasn't sure whether the extra
> mangling on alpha was necessary.
>
>> Alternatively this could do something like the arm32 version (note
>> that on arm, PER_LINUX_32BIT/ADDR_LIMIT_32BIT means "allow using
>> the entire 32-bit address space rather than limiting to 26 bits for
>> compatibility", while on alpha it means "use only 31 instead of
>> 42 bits for addressing", but the logic can be the same):
>> 
>>         unsigned int personality = current->personality & ~PER_MASK;
>>         /*
>>          * APCS-26 is only valid for OABI executables
>>          */
>>         if ((eflags & EF_ARM_EABI_MASK) == EF_ARM_EABI_UNKNOWN &&
>>             (eflags & EF_ARM_APCS_26))
>>                 personality &= ~ADDR_LIMIT_32BIT;
>>         else
>>                 personality |= ADDR_LIMIT_32BIT;
>>         set_personality(personality);
>
> So, this would be the 100% correct for alpha then which would not loose
> any functionality even for 32-bit binaries?

I don't think it is correct to think about 32-bit binaries on alpha.

Alpha never had a 32bit instruction set.  But at some point it looks
like binaries that could not handle more than 31 bits of address
space got ported and someone implemented a work-around.  I guess this
is the --taso option that Arnd mentioned.

I think the alpha version would look like:

#define SET_PERSONALITY(ex) 							\
	do {									\
		unsigned long personality = current->personality & ~PER_MASK;	\
                if ((EX).e_flags & EF_ALPHA_32BIT)				\
                	personality |= ADDR_LIMIT_32BIT;			\
		else								\
                	personality &= ~ADDR_LIMIT_32BIT			\
		set_personality(personality);					\
	while (0)

I do see code under arch/alpha/ testing ADDR_LIMIT_32BIT when
setting STACK_TOP, TASK_UNMAPPED_BASE, and arch_get_unmapped_area.
So I think the code still works.

>> In any case, I think we should fix alpha, mips and loongarch at
>> the same time, to make sure it doesn't take another decade to
>> fix the rest.
>
> If you're willing to fix all three at once, I would be happy to help
> with the testing on all three architectures as I have machines for all
> of these.

Yes getting those fixed would be nice.



I don't expect it is worth the hassle to remove support for
EF_ALPHA_32BIT, but I looked into it quickly.

I looked at the history to see if I could find any information about
what was using the EF_ALPHA_32BIT flag and unfortunately I could not
find anything.  Support for the flag first appeared the 2.1.86 release,
and the change description has been lost to time.

Does anyone know if there are any remaining alpha binaries that set
EF_ALPHA_32BIT?

If no interesting binaries have EF_ALPHA_32BIT set anymore
it might be worth using the generic SET_PERSONALITY and implementing
an arch_check_elf to just fail if one of those binaries show up.

Perhaps:
static inline int arch_check_elf(struct elfhdr *ehdr, bool has_interp,
				 struct elfhdr *interp_ehdr,
				 struct arch_elf_state *state)
{
        if (WARN_ON_ONCE(ehdr->e_flags & EF_ALPHA_32BIT)) {
        	return -ENOEXEC;
        }
	return 0;
}

Though frankly it might make more sense and go the other way.  I think
only mips has a non-trivial implementation of arch_check_elf.

Eric


