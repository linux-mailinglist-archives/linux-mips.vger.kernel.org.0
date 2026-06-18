Return-Path: <linux-mips+bounces-15131-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RF1IKCyqM2pTEwYAu9opvQ
	(envelope-from <linux-mips+bounces-15131-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 10:19:56 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCBF69E661
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 10:19:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15131-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15131-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C48A130131AD
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2026 08:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939FB371899;
	Thu, 18 Jun 2026 08:18:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7678369D4A
	for <linux-mips@vger.kernel.org>; Thu, 18 Jun 2026 08:18:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781770739; cv=none; b=bwrhGE7rmi1wx71Ygurt7KKNg/+q1ecbSqTxepowe830xFAR4txJoMukMInZB8QA+7PhKuXcRYNFwDwB6x5lqH4y/PCJk+hdHnqlPnr/zEnzW+vH2X08wchTrs0DdKiP9GoLxfTHPXnSPH5O7OVBys5gW3vNO8jE0b0YrXQb1Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781770739; c=relaxed/simple;
	bh=qT3TGQ4d0y9tUfJc/hPKLXqZe+/2KGNG6EH7xLEU0DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfPLt+ePQMoFEijfSsiUce90aZEmAshd7omEUTPCUksOghatCpGyCJafs65WzsSbOd7f4f9w9lw18I+OE8R2x2wp2on234A3zYbqdAsOXVpGcxraz6xVfrABS6FvyS5T6Fa1QOst7oPSrnTcXwxg6cIeKVWfe9Frzv5t4I0Ereg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.50
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36d6bb38b44so294337a91.0
        for <linux-mips@vger.kernel.org>; Thu, 18 Jun 2026 01:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781770736; x=1782375536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKAZNU0FmJW8v6thQLRjRHc5rQqn36zhhyWy7vfjOZ8=;
        b=qNYV86pqRZ497Af/BIqmxRtntSUSy4/Yc2mxzbPmUSPoG1NjT1QdYd/66YflLGGMs1
         PpUR9NpsXQ1j07cCsKC/tCs51oSPDOebVufsDfhCEcfDQ5MeAgy3rilBe64sXBU2dLTy
         qMAKEfKvZpQKPGeTFdfdFmoosga47x88hWVmWuJAVwf/dFxVV3TodM1Su7zrTmxrckSq
         QCH/cBYGH/1QM3uFJ4ynqxxoIIyO1Xl9bbpGcm5zI6F/IfVOULnLBtTjH//5nX6v65Gp
         Se59tAlqTeFVPau5jV7reO4zvzdu/37JDQWPiyc8msyQRijmsUVdZPJFKpt3OFhYHm6Q
         J2uw==
X-Forwarded-Encrypted: i=1; AFNElJ8qb9acoRabKx3mHtv0ec50RM8ofhdpQAw2xzML1zvpzQBMM7jNqR5Au1CUh8wJiFjT2F/rEke1TRr0@vger.kernel.org
X-Gm-Message-State: AOJu0YwYV0q8DVj4OcFnDq4jPSJClliqkw19atAdk9V+MzdjZntfaguy
	a0GLNpakP5kP0cOpHnUCQDY0dxxYkSpjOiZ/gK11mufVgOzifcH0ekWw45VDVGpK
X-Gm-Gg: AfdE7cnwC753rw3IFbx/z3s3bGs6XCSdOYMV9Evtlc45W/bL3FHQwfOAEFDKKVi/F2I
	7zYKFbOE4HrnjBLDFkk6F/egElZw3p0ZkljELpNhSSVKvLie54u0GdILpejHq6FVR4YlwhvlTh7
	zHGTOnbAfNKNbU3mGKDPTYwsqxgDo1Hj66tD6yn07k3RSTOFe70yY2aJdx6vYJiwKkSkfWukZrb
	L5o3qV29xb+n6rfq0u+3yw91Bcsr7aLWYt0UlCAOnvRyPInttEhAnJaL7uERadwNDacPC6gkabp
	kdKds0w7chRZDtSniUzCx9D8n50qLnHDpJeuUIYTbqQ2uUUWIut3pfSawRxLTLZ3do221AQsRKe
	EGvnpPORQnUXp9iiIrRVrwDRNIskBHR4JE5IibdIO9m1mrv2i4539YqjxBVbmAl0dGfBW/q+NDu
	9NxDHYOc9RfBwmg2lGMWRNQ47wWZT3IIIZ/OOjS+OvemSthB6K
X-Received: by 2002:a17:90b:3847:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-37c9404fc44mr7865550a91.13.1781770735939;
        Thu, 18 Jun 2026 01:18:55 -0700 (PDT)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com. [74.125.82.51])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186828sm15341532a12.21.2026.06.18.01.18.55
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:18:55 -0700 (PDT)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1397e093f90so1892382c88.1
        for <linux-mips@vger.kernel.org>; Thu, 18 Jun 2026 01:18:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Xmyv3laCheyk+9+L14yCF35bC2qtggJY4bUyuZPW/LhfGiP09vlL+GBn9JNouPkwWpr1iu5KVKarr@vger.kernel.org
X-Received: by 2002:a05:6102:1626:b0:634:92c:bdd0 with SMTP id
 ada2fe7eead31-7245cec5b37mr3787588137.6.1781770401826; Thu, 18 Jun 2026
 01:13:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616084901.3319d82e@kernel.org> <1781694488854.956546368.818588236@strotmann.de>
 <489024bc-b6e5-f601-3bce-444d75abbf5d@linux-m68k.org> <2791b2e3-bf58-4dce-9262-4f1d8d3241fb@lunn.ch>
In-Reply-To: <2791b2e3-bf58-4dce-9262-4f1d8d3241fb@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Jun 2026 10:13:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0em2r-SixT_+EpWJnm4f0g8mReYKBXOw42=HGb_T8WQ@mail.gmail.com>
X-Gm-Features: AVVi8CfLJ0ddT-LhKt0W0uHSh_81VvaoqDXBIXepEwXCQOI5G8FSGq0oRl6-8XI
Message-ID: <CAMuHMdU0em2r-SixT_+EpWJnm4f0g8mReYKBXOw42=HGb_T8WQ@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] appletalk: move the protocol out of tree
To: Andrew Lunn <andrew@lunn.ch>
Cc: Finn Thain <fthain@linux-m68k.org>, Carsten Strotmann <carsten@strotmann.de>, 
	Jakub Kicinski <kuba@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, davem@davemloft.net, 
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, horms@kernel.org, chleroy@kernel.org, 
	npiggin@gmail.com, mpe@ellerman.id.au, maddy@linux.ibm.com, 
	linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15131-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:fthain@linux-m68k.org,m:carsten@strotmann.de,m:kuba@kernel.org,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:chleroy@kernel.org,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:linux-mips@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[linux-m68k.org,strotmann.de,kernel.org,physik.fu-berlin.de,davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,gmail.com,ellerman.id.au,linux.ibm.com,lists.linux-m68k.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,lunn.ch:email,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FCBF69E661

Hi Andrew,

On Thu, 18 Jun 2026 at 10:01, Andrew Lunn <andrew@lunn.ch> wrote:
> If the appletalk community can take the workload off the top level
> maintainers, respond to all patches within 2 to 3 days, give
> Reviewed-by, or make change requests, it can probably stay in the
> Mainline kernel. Otherwise it will move out of tree.

"2 or 3 days" is rather short.  If we would have to move all code
maintained by people who cannot respond to all patches within 2 to
3 days out of the mainline kernel, you'd end up with a networking
subsystem without supporting OS ;-)

git grep three.*week -- Documentation/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

