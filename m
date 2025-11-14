Return-Path: <linux-mips+bounces-12235-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ECFC5B4BE
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 05:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 19C4035381C
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 04:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459502877FC;
	Fri, 14 Nov 2025 04:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JpQ9qeou"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1147C2877D6;
	Fri, 14 Nov 2025 04:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763094184; cv=none; b=PD/2JruQNOOF0gRmWNMj5+QwX+zqXmkhAg1vc8wVhFjFwpVbmznJo7Vd2/nmGwCMmcgy/Oy19KDc0FrbYFWGlYcyAhFIBT9QPiVJcThP1jwXPxaDTwxX6rEhwJWgnxtjPI78lCWGQ3jyXcPeyIGUsy/toSz40vo8WoWE9BcUknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763094184; c=relaxed/simple;
	bh=RobVRCgZWKDAOE0gDSu7wYFNPR+HLgdW/UejZYDDlGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwosUN2xICIV0XvSLPmJSh10yrAGl9HL/ZHukSmc9/CccjnO8ZnpJNdMmxZ/EtnA+cM4byD5VX2vBe/VUz9M1WreN9Nye9kr0rmkmsY23olojpug/jS8Ukyops8E4KUtmkRaw8z0NalEExrnkcjI9yIeFvzC6HF2p7sCslLCNBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JpQ9qeou; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C574FC16AAE;
	Fri, 14 Nov 2025 04:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763094183;
	bh=RobVRCgZWKDAOE0gDSu7wYFNPR+HLgdW/UejZYDDlGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JpQ9qeouOkhcbiv4XbYPE+RA9hjIDmMQ+z1O63pqvJGFha1JCpQaMOcKWJgzbo8tk
	 XJ4yA30qSWHnrF0Xbwx9XxwaF0nqeyeu8ltfDqZPbN3oex3L07o5IThMLseHcDg6Bv
	 1fAuESBIcya76J7XaQggkHMa4Yk+pn7g9Vu2i9/p55spB0NQ8CVygWnFp30/HA2jVh
	 P2AYeyhI/xe9XkmCwZgHndjonZMsbW6q7wfnGOteYAV8PYxLE0bQz5bLBmRsnPFe95
	 PgIaRb96v6thoR4zQ8OxMZQCYI5p7PTlsPB72vjiLqaxbzH5FAExUCREc5KTbvjwxG
	 7NLMjsjSUxLpA==
Date: Thu, 13 Nov 2025 21:22:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nsc@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 00/10] kbuild: userprogs: introduce
 architecture-specific CC_CAN_LINK and userprog flags
Message-ID: <20251114042254.GB2566209@ax162>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
 <aRToC77bNUy2sKAK@derry.ads.avm.de>
 <20251113102307-ca2180c8-4876-46ea-8678-aaedd9ba36f0@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113102307-ca2180c8-4876-46ea-8678-aaedd9ba36f0@linutronix.de>

On Thu, Nov 13, 2025 at 10:31:10AM +0100, Thomas Weißschuh wrote:
> On Wed, Nov 12, 2025 at 09:03:23PM +0100, Nicolas Schier wrote:
> > Thanks for the patch set and all the work behind!  I found only one
> > issue in patch 3, the rest looks good to me as they are.
> > 
> > I haven't reviewed the compiler flags for the archs, but from the formal
> > point of view they look good to me, too.
> > 
> > How shall we proceed with here?  I think, easiest would be if we get
> > appropriate acks from the architecture maintainers, so we could take
> > this via kbuild.
> 
> That would surely be the best option. Unfortunately quite frequently it is hard
> to get architecture maintainer's feedback on a cross-architecture series.
> 
> > Other opinions?
> 
> It would also work to only take the first three patches through the kbuild tree
> and push the other ones through the architecture trees.
> 
> I don't really have a clear preference.

If you do not have a preference, I think it would be easier if Nicolas
picks up the first three patches (which I will go review formally
shortly, sorry again for the delay on that) to make sure they make
6.19-rc1 then you can send out the architecture changes individually
with plans to pick up any ones that have been left behind after a
development cycle? That should give architecture maintainers enough time
to properly react and review the series (since they will know if those
flags are appropriate). We could probably send the last patch as a fix
if those changes do not land until 6.20-rc1.

Cheers,
Nathan

