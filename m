Return-Path: <linux-mips+bounces-14212-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TK/AHRVo52ke8AEAu9opvQ
	(envelope-from <linux-mips+bounces-14212-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 14:05:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A5343A6A1
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 14:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 986C13005173
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2026 12:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A163A7825;
	Tue, 21 Apr 2026 12:04:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ADD1B4F09
	for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 12:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773098; cv=none; b=fSto5LuHMNtkRVNeiKyB8Qzo3zt+GrSo4b9heBO0JHg+FEYWy7O4VZyCO4pflBiU4ShXlZrK1d1tJkVYltgpSykVSii+szFt2CPmUNSb278T6iPNRQDu0ff7uaVJFqTmQRpREiY9sVwSzgYsV9JTJlq9ur4DoGkshOFEC5fNMa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773098; c=relaxed/simple;
	bh=D2pg4QST6SQsj9Y0AlZ3xwmYOqacTuU/qi+aAUKUt00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEXw/EmpxIDDTDTXhwvMgPxIa7KkSSiOHQxmnSIHAPLKSIoBsdSVaLTD7C4xPBgN+uQ06nxLUOJKrrfUbTj2CefuKFhhVMCjaSv4j9Zrr4ZfMlClNfl/AARjEAR+QOE/sKIZUCrrPN+/yxfSMJG2E7/XueEGZlECSfNZiotv9Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-694885bf090so914909eaf.0
        for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 05:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773096; x=1777377896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ji5jUeRQ9s6IdrcvkqpKzzaDEFKSxwSRUCTUPQc2w4=;
        b=BEzMidp/8yDs3bo06vOKJgypowa8awVn3I4f3XyYw7dkQ3qiv6+Phwghv42sK5bF3w
         OnWJpWbf5AkvOhUdguBskKa18lvfg/hsbb88FVgUUBvVJgiLYrigO9oaOgUbtJb8u/J3
         fYVgsueIRFdfdD7cBIg0wVaBHlM/ScogPOOK8iLeLojjp3qgnhicybNWVea/6NVebFym
         S1SAh3fWK/jvPVtabmZnp7jKgDYXzHoym27TyurzPOW+0n87NQF23tt6iTB2Ozojg6X9
         EpEo0WF00tzdqpi60WcUKnIGvx0JAO9eSbS0p4mlNbN193xJb/ebTD6IfdaoqRaP7DFr
         BRtQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qvbO28fu+gao+3W6MNxWnQlq+we65yqYdo7UFXxEbV30HiGLXNzLOWuBWrV5Ajggd+d32lg5rtXon@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn9BbJsbfLF7iud+TK/1pmQ1rmr39ZFtpe5ndwyoflXbI+UFb+
	zZdeD14Nt/P7rLo3x/E6K2RKHln35nayg1AwvXBGq0hBOYAPLb8CUeUxCe7PIoSlEKU=
X-Gm-Gg: AeBDievgWneOX3vMM5mrozHLIrjWVHWR05fNAr68XexK0qzAgtByIBEAKhYWiLpoRs0
	rL0DCsHOZJrPI5Mo4+Vk6ihRsiZpt1vXa80riWjvw3RrP0ITR/YrUMpzkTty/dWl3AT/UY3jv3+
	mf+5pTpIVl4OZSVX+/caB/2klQWmVsYN8IrAt1ovGYbcjjsUHITl4GH+SMXV/pSqkwEpa5x4GTN
	vbrYhptaY9un2Jy0vdUg1eucDCSGOfxZZfRIXssvghbl2wqmyQzHihIofWFDw7l42B7sa2Z6upg
	AzVvgFluxJ/Z8uhb07P9CKX3M7hz2KujhBjfa+X8KwyE9YoD9uqtMvp6fFkUmQ6aYw3Vick90Qg
	LUTNNjZyK+1KXWLlU7AMSaKCsCX7iTIAYrNg5xwb4ndNK5L+fKMx4Uak1S4TtdplhkwxKTCbvLD
	gAquZqVQpOA7hux5Gf7VqVPJJsuF9RvNfk7D5RJYc+ez/4YYveZX2x9IMCcimw33Yf9LcdC+g=
X-Received: by 2002:a05:6820:1384:b0:689:613a:f2fe with SMTP id 006d021491bc7-69462ef2380mr9454811eaf.36.1776773095904;
        Tue, 21 Apr 2026 05:04:55 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6949127c1e2sm2306910eaf.15.2026.04.21.05.04.54
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:04:55 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7dbccf6a23dso3517982a34.2
        for <linux-mips@vger.kernel.org>; Tue, 21 Apr 2026 05:04:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Z6fmKEZGhLJD5XfbbbCEhkO0Q3lb1g720CphxDeNwRs347LlIXIe7KQL9Beh2cwvgl/ISXfe3P+ig@vger.kernel.org
X-Received: by 2002:a05:6102:f8b:b0:601:f386:9ed2 with SMTP id
 ada2fe7eead31-616f4d67f72mr7641295137.7.1776772665998; Tue, 21 Apr 2026
 04:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421021943.1295109-1-kuba@kernel.org> <c7506c225ce22a71c03abc2673823cf84bbb5b0d.camel@infradead.org>
 <aedkZ5bizasuBPI8@gondor.apana.org.au>
In-Reply-To: <aedkZ5bizasuBPI8@gondor.apana.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Apr 2026 13:57:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU96F_42faeqNzDwaXks7mFrLrkPSJB_QTwxEn9HmVWpQ@mail.gmail.com>
X-Gm-Features: AQROBzAVi0Fh-UpifM1LaPGNEDH0ax6I6xOmcEB0yUP_KKo8UOyxGmDNb2nIMYw
Message-ID: <CAMuHMdU96F_42faeqNzDwaXks7mFrLrkPSJB_QTwxEn9HmVWpQ@mail.gmail.com>
Subject: Re: [PATCH net-deletions] net: remove unused ATM protocols and legacy
 ATM device drivers
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David Woodhouse <dwmw2@infradead.org>, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, 
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, 3chas3@gmail.com, razor@blackwall.org, idosch@nvidia.com, 
	jani.nikula@intel.com, mchehab+huawei@kernel.org, tytso@mit.edu, 
	ebiggers@kernel.org, johannes.berg@intel.com, jonathan.cameron@huawei.com, 
	kees@kernel.org, kuniyu@google.com, fourier.thomas@gmail.com, 
	andriy.shevchenko@intel.com, rdunlap@infradead.org, akpm@linux-foundation.org, 
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, bridge@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,lwn.net,linuxfoundation.org,armlinux.org.uk,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,blackwall.org,nvidia.com,intel.com,mit.edu,huawei.com,linux-foundation.org,lists.ozlabs.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-14212-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev,huawei];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,apana.org.au:email]
X-Rspamd-Queue-Id: D8A5343A6A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Herbert,

On Tue, 21 Apr 2026 at 13:51, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> On Tue, Apr 21, 2026 at 10:26:18AM +0100, David Woodhouse wrote:
> > I suspect they don't have a huge amount of interest in the Solos any
> > more, or the Geode-based SBC they sold with two of them on-board. But
> > OpenWrt does still support them, and I even have one here (although no
> > ADSL line to test it with). They were briefly popular as fully Linux-
> > supported ADSL routers.
>
> ADSL is history, it only ever made sense in rich countries where
> physical copper cables were pre-installed in homes.  While rich
> countries have moved to fibre, the rest of the world won't use
> ADSL either because there is no copper cable to begin with.  So
> it's actually cheaper to just lay a fibre cable for a new install.

I am afraid the move to fibre hasn't been completed yet.
ADSL (VDSL2?) is still being used.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

