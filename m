Return-Path: <linux-mips+bounces-7409-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEBCA0AEC7
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2025 06:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33F8218846BC
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2025 05:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22E414A60C;
	Mon, 13 Jan 2025 05:33:48 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D252F852;
	Mon, 13 Jan 2025 05:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736746428; cv=none; b=SSwT0Y+NFQgHpHyCTiRs+GJWzz+NhPJyUYr8QKZkwdNgVjvUvYPi9wj8sgs36Wg4Crcd0/C3nwKSChZt7H6J1JHCp6dbK2bA/qs4NLN3d40hJCMMZ4wpPWmSGL9NcPVEXHuD8vKnFTBMp2tj8qTPB757f6oOo+mhDl7wegGqhhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736746428; c=relaxed/simple;
	bh=6kgf0Y1DnjB7/4vkH8/ROm9TSERfddva2KwyJlW1rSc=;
	h=From:To:Cc:References:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:Subject; b=eOLLDhiZyCESVtKjD2/jOFafDOMGR7EUn/EnoISKV+PjOb6XBONwmCw3KJQAEVe6MB5byZhXz49NSNJsFTQujyfMdJ98dt/hVJx9wDsNcJZO7VAdGImWajvfmjtS8k/kw+eDCdoR71FK9gI3f2BFEzPxcybLB9kSH28WETLOKdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in01.mta.xmission.com ([166.70.13.51]:43564)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1tXD4v-000YH6-OQ; Sun, 12 Jan 2025 22:33:33 -0700
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:36184 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1tXD4u-00HTmM-DJ; Sun, 12 Jan 2025 22:33:33 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Ivan Kokshaysky <ink@unseen.parts>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,  Arnd Bergmann
 <arnd@arndb.de>,  Richard Henderson <richard.henderson@linaro.org>,  Matt
 Turner <mattst88@gmail.com>,  Kees Cook <kees@kernel.org>,  "Paul E.
 McKenney" <paulmck@kernel.org>,  linux-alpha@vger.kernel.org,
  linux-mm@kvack.org,  linux-kernel@vger.kernel.org,  Michael Cree
 <mcree@orcon.net.nz>,  Sam James <sam@gentoo.org>,  "Maciej W. Rozycki"
 <macro@orcam.me.uk>,  Geert Uytterhoeven <geert@linux-m68k.org>,  Michael
 Karcher <kernel@mkarcher.dialup.fu-berlin.de>,  Chris Hofstaedtler
 <zeha@debian.org>,  util-linux@vger.kernel.org,
  linux-mips@vger.kernel.org,  loongarch@lists.linux.dev
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
	<24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
	<678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
	<bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
	<82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
	<cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
	<87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
	<Z4KN_aOT6uZRAm8a@minute>
Date: Sun, 12 Jan 2025 23:32:54 -0600
In-Reply-To: <Z4KN_aOT6uZRAm8a@minute> (Ivan Kokshaysky's message of "Sat, 11
	Jan 2025 16:27:57 +0100")
Message-ID: <875xmjth15.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1tXD4u-00HTmM-DJ;;;mid=<875xmjth15.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX19mzMcFcnq2MyXKMRJsTojlTxbl78vUQO0=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4714]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Ivan Kokshaysky <ink@unseen.parts>
X-Spam-Relay-Country: 
X-Spam-Timing: total 763 ms - load_scoreonly_sql: 0.09 (0.0%),
	signal_user_changed: 12 (1.5%), b_tie_ro: 10 (1.3%), parse: 1.27
	(0.2%), extract_message_metadata: 18 (2.3%), get_uri_detail_list: 1.68
	(0.2%), tests_pri_-2000: 14 (1.8%), tests_pri_-1000: 3.4 (0.5%),
	tests_pri_-950: 1.28 (0.2%), tests_pri_-900: 1.07 (0.1%),
	tests_pri_-90: 441 (57.9%), check_bayes: 430 (56.3%), b_tokenize: 8
	(1.1%), b_tok_get_all: 8 (1.1%), b_comp_prob: 2.4 (0.3%),
	b_tok_touch_all: 407 (53.4%), b_finish: 1.12 (0.1%), tests_pri_0: 256
	(33.5%), check_dkim_signature: 0.84 (0.1%), check_dkim_adsp: 2.7
	(0.4%), poll_dns_idle: 0.89 (0.1%), tests_pri_10: 2.8 (0.4%),
	tests_pri_500: 9 (1.2%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] alpha/elf: Fix misc/setarch test of util-linux by
 removing 32bit support
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: loongarch@lists.linux.dev, linux-mips@vger.kernel.org, util-linux@vger.kernel.org, zeha@debian.org, kernel@mkarcher.dialup.fu-berlin.de, geert@linux-m68k.org, macro@orcam.me.uk, sam@gentoo.org, mcree@orcon.net.nz, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, paulmck@kernel.org, kees@kernel.org, mattst88@gmail.com, richard.henderson@linaro.org, arnd@arndb.de, glaubitz@physik.fu-berlin.de, ink@unseen.parts
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out01.mta.xmission.com); SAEximRunCond expanded to false

Ivan Kokshaysky <ink@unseen.parts> writes:

> On Fri, Jan 10, 2025 at 06:16:28PM -0600, Eric W. Biederman wrote:
>> 
>> Richard Henderson <richard.henderson@linaro.org> writes[1]:
>> 
>> > There was a Spec benchmark (I forget which) which was memory bound and ran
>> > twice as fast with 32-bit pointers.
>> >
>> > I copied the idea from DEC to the ELF abi, but never did all the other work
>> > to allow the toolchain to take advantage.
>> >
>> > Amusingly, a later Spec changed the benchmark data sets to not fit into a
>> > 32-bit address space, specifically because of this.
>> >
>> > I expect one could delete the ELF bit and personality and no one would
>> > notice. Not even the 10 remaining Alpha users.
>> 
>> In [2] it was pointed out that parts of setarch weren't working
>> properly on alpha because it has it's own SET_PERSONALITY
>> implementation.  In the discussion that followed Richard Henderson
>> pointed out that the 32bit pointer support for alpha was never
>> completed.
>> 
>> Fix this by removing alpha's 32bit pointer support.
>> 
>> As a bit of paranoia refuse to execute any alpha binaries that hafe
>> the EF_ALPHA_32BIT flag set.  Just to fail explicitly in case someone
>> somewhere has binaries that trying to use alpha's 32bit pointer
>> support.
>
> In general I agree, but then someone ought to remove the "--taso" option
> from GNU ld, which produces such binaries.

Please feel free to write such a patch.  I don't know the GNU ld process
well enough to write that patch.

It would be good to remove dead code and confusing code from GNU ld,
as well as from the linux kernel.

Eric

