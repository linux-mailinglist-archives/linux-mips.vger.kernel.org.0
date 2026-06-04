Return-Path: <linux-mips+bounces-14905-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tVJHGBfnIWqUQQEAu9opvQ
	(envelope-from <linux-mips+bounces-14905-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 22:59:03 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A7B643809
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 22:59:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iknnO2pz;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14905-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14905-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C461300CDA0
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 20:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EC2438FE3;
	Thu,  4 Jun 2026 20:58:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCB53C4B87
	for <linux-mips@vger.kernel.org>; Thu,  4 Jun 2026 20:58:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780606720; cv=none; b=VEfHLkJDRGuc1JPBt2NRlkLHM0ZUXQJnxbHTpdNeK2vxqGCYOUco+w2M7ypahzlQl2A0rok8m7C2yIm8h0+1UNyqztSZBiybUBEm/U2cf5cQqw/05RNT53AGOL6aGgtgxPY/CU78agt99UJvk/fixSeVz+WEU79nwmnr6pYo5GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780606720; c=relaxed/simple;
	bh=DQTkf1lHMIqbwK47/czYzHj+glOCSShwPoAIlDnSnRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oh1KDElVQs4G9MMeRsR84G7A773wD8HDOKCp8OdhDXkKe/Z4gCia7lwHbrwXAbW3tYT8FYy4wp7DBG32dcs8Fu0r7tqTkhVsycB/Jq1wNqvAdG1+03jHX8mxlCA8Qe+fDNOnHUOqvsHIxFGeCoR5EBZlP5Y6L6a6aOb9D2I2Nuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iknnO2pz; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so9623545e9.0
        for <linux-mips@vger.kernel.org>; Thu, 04 Jun 2026 13:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780606718; x=1781211518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DQTkf1lHMIqbwK47/czYzHj+glOCSShwPoAIlDnSnRw=;
        b=iknnO2pzYAxVBr5i32I5mNFlyUF4hG16k08qD4F71/MXpgO41aPReHIyqAUUCJV6RS
         ViihSrIEddeu0NhEUPgs9lB8hDS+Ep36XfsjybRB+5GMugVp4FyZhL9U0kHhkOduxGbT
         maWotG0ZImKwZF7omJlhECYYrhgdvXilFsiefRidN5gYZPFckPzFPAR/C47NAPfVGjps
         7RHYlODTmTQhgbviG7ZVGmzhgRzv7pF5ksNClaagSXvoSSJmfCcX2whiiZxpwoscAXQB
         snl2pwk1CGqeCMF2Foq66rJF/MxGmx74R8cuKe5FYm1qsjt5qmQ8p4H7Ao3iwKimMlol
         8Jkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780606718; x=1781211518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQTkf1lHMIqbwK47/czYzHj+glOCSShwPoAIlDnSnRw=;
        b=HmqE6YN+vT+M4djdmNON5JgTUy6F3D8BaPGpR568Kp35LFYi/wRyPdMzEZTc3IevHx
         RyEr5D8xDoyBG8qiq5AXF+xo4oO80ZrGw7SRcRlOg1auTS0ejUuqOpBuo8Amrw4vugkx
         Vq6gJKXcp/dxukgBVh+vtbcTQn3UFsqMYCouLnm7ZSiUZr0VypFDIAtgqfSjOi36AGP7
         mTYIdGM8QFdoqXVSA9J+9YKSb0W0rtbSirBh/0KoD0jJ9V8qYHLjz6zc6Js9w8XrQ4he
         s4gbSht5zHh0xLdiAd4v1fNrPmtxYRXzBTgaRmnBTWpVExnfc9Tsfk7SvNOtTfny4j59
         f5/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+yywARPJDNTfIf1h6HDlNpnQL9szGFjVMeQAR2nEH6Rmq5ok4f+Zh5Cz6W5V8IFiHMUw7dRQhXt0lY@vger.kernel.org
X-Gm-Message-State: AOJu0YwET4Byf/wXqrzLjnP+wus7JaAzhepb0irXciIeiGRorS4KoT5C
	rhJ9e9pRZKmD0oVOVKHe9og1scS3n6x7h6x8Td2IQno3+UnyuuCHe5/N
X-Gm-Gg: Acq92OGm8hd9NnOMdhdALpzwuDEF2E9LHxIFhQqTbfRBMWZPvSZ+xLJa8kVBZaKu0dk
	56+gXMX0XoFbUIWgJBMvp/0yZAvQKgjDoJ9CJ2DMJsrWwe8LHyW/UrzUkv0Jc9neWJv/K1pBhST
	ewE8fi7BrQgvfL1u8uE5ptESrRr65rdw5vFE8U9efj1So6XmVo2xYYdV1nHIsMpaIjZO5Fx3BFu
	lCKoW88ZqYRwZ3sn3zuccsU3otyvXii4eMbYC7YNQ84mTpcKwieVjiSn6ZdzZl9nELJGuLLoqvE
	YRfTRmgvbkNOZBZ+jteJPi5B3p5jxWHBIdUnU3v7SgDRYveGUVarkHwPATrvId+t2S+GzQ76YcV
	MorpUTSCE9AKeUdF0T+pF0vQdB+cUnIQdrgoCPxsYRbvw3vLchYnem8LDFlX2iNZ6jiYLQT0Ci7
	vlE+OyOz+JLE3Ss+XLx4boq8LNqzpSUPOo
X-Received: by 2002:a05:600c:83c3:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-490c25a21a9mr4351475e9.9.1780606717742;
        Thu, 04 Jun 2026 13:58:37 -0700 (PDT)
Received: from localhost ([94.53.77.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm100278155e9.15.2026.06.04.13.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:58:36 -0700 (PDT)
Date: Thu, 4 Jun 2026 23:59:21 +0300
From: Catalin Iacob <iacobcatalin@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Jens Axboe <axboe@kernel.dk>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v3 0/6] Remove remaining references to the pktcdvd driver
Message-ID: <aiHbj0zn4y9X6qV2@toolbx>
References: <20260530-remove-pktcdvd-references-v1-1-aa56941d4315@gmail.com>
 <20260604-remove-pktcdvd-references-v3-0-e2f06fb4eef4@gmail.com>
 <96a48e65-6ee2-4b81-91f8-821a2de707db@acm.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96a48e65-6ee2-4b81-91f8-821a2de707db@acm.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14905-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[iacobcatalin@gmail.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bvanassche@acm.org,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:axboe@kernel.dk,m:ysato@users.sourceforge.jp,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-scsi@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,libc.org,physik.fu-berlin.de,davemloft.net,gaisler.com,hansenpartnership.com,oracle.com,kernel.dk,users.sourceforge.jp,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[iacobcatalin@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[toolbx:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3A7B643809

On Thu, Jun 04, 2026 at 08:50:22AM -0700, Bart Van Assche wrote:
> If this series is reposted, please combine patches 1/6 and 2/6. Anyway,
> this series looks good to me.

Thanks for taking a look.

I will repost in a few days when back to a computer to fix the subject
of patch 2 since you are right, it does wrongly suggest that the
implementation is moved.

For learning purposes, do you mind quickly sharing your rationale for
combining 1 and 2? To me they are in the same area but still separate
things: one removes dead code, the other increases encapsulation. Each
is a small but worthwhile cleanup, they can be applied in any order and
each can be applied without the other. It's true that, while patch 2
without patch 1 works, it would increase confusion but I find that an
argument to order 2 after 1, not to say they are one thing.

I'd also find it hard to describe what that combined patch does except
by calling out two things: "remove dead code and move the declaration".
Your suggested "unexport" seems more confusing than clarifying, I'd
argue that today the symbol is not exported since that ifdef always
compiles the export out.

