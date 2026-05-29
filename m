Return-Path: <linux-mips+bounces-14819-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKcYOXomGWq9rAgAu9opvQ
	(envelope-from <linux-mips+bounces-14819-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2026 07:39:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDE65FD698
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2026 07:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A70E830C0E8E
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2026 05:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C373A16AC;
	Fri, 29 May 2026 05:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGrftDdx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3555538E5CC
	for <linux-mips@vger.kernel.org>; Fri, 29 May 2026 05:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780033028; cv=none; b=XZDI1SDe2xD5NDpFbmatMH6ELVEMcsjcVhuqaQeJKqOoDdSqr8//s2duG0JjpHRJNrT6WvUQnrVpYg22KL+rVEsFDxJBkzJmw8st25sOuzNxqG9Lj1LaunMxHinZR12nQv8/Bja1a9R0OCW/sq9k+DOsnvs/5OGISScEDkwnW8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780033028; c=relaxed/simple;
	bh=U/u+I7Fjs+lyPrjV5mTGiCw54swil5vB5IqkaePU3UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/IWEnsSoTHVg4yU+MEtsddCI8W38AUkQ38PRoo85yinU+eUfUd6NSum/kDsjmm8ZGtyNCnVVZdWPeCC7ofpRbilX1OEcPpNnaer8E1JeGwRNG48W+naUE1RHsCYxXvwy9PJ2eVu3lXJYWbsNjYp0J0jWsfdfGi/fa8fannHy8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGrftDdx; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1363e78746eso9885029c88.1
        for <linux-mips@vger.kernel.org>; Thu, 28 May 2026 22:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780033026; x=1780637826; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b3mngTSiQ9G4QDQdoy3QdNFGLu5UDTjPqyOy5Rx/Ffg=;
        b=gGrftDdxpBqeEcytuF5cMQivW8TLP4X3skIaFHpeJvM0bkgwWiUxNyfbJQ6N0n9Nnv
         23NhooJzbJjpL3HS//soTiF2H1Jz1hokAV61p6wLnyy7muOB5dVjifRy6Q/vJhGGRQsP
         9od7sc2lJz1LE7pvzI4Cv5Ymik3J5VXURow1bXTxx1meU8D/tMLumKW2voUjQIc58P6B
         xcn00iQe+BNYjmW7eNBTCIqwcBptl1MSod/KdGsU92p1KzWHrmEy/1se9JrHn9cO7F+O
         XVzU0QckkcIitEwwHaQdY1TIGeeEBHjW80XpoGehapMt7ZYnXgQACsnmFxuYbTievMKK
         tNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780033026; x=1780637826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b3mngTSiQ9G4QDQdoy3QdNFGLu5UDTjPqyOy5Rx/Ffg=;
        b=NsIxv6nhYmUzxjzx4Boqg/Wsd7TyNX9qcZoCxwa53D+mg/OLWiQuSzGU21B5X+3e49
         iIsPpA0zyuVRGa1oS4LqnAj7uVpcvvfVbG2BAfn1ecvZmNsOYxKY7YQxMIX+O2noxd+t
         KaYtnjGwB9CQL9SzxfAooxgFxy3PnAvQi4y/hXhZ2tgXfhpX1pILSa8SLll/QUNvDYrs
         nto8yZxnB8u+YOzJ+gZH1RmB8T2iz7ges9j4y1Vu+eHiJDblr6LYUWfOgijhHKgCNpRj
         9Nhz82KxpQM5gdVTksfdIvbANeN60f0AjBbj1PZuyZAsZ8SsJI4q4qBVUMY6X/Ll9F35
         05Bg==
X-Forwarded-Encrypted: i=1; AFNElJ9TJzlZRiNjYs1ppMrfFY05I3RDh2ij+1y8+lzj7OdHckNVWmMhJIAZ/pt28G/UoXU191TjCysOW1wL@vger.kernel.org
X-Gm-Message-State: AOJu0YzuIywjlAur1mlNB9cYPO2onWDk1rSURr/DhgK1xJt/8OW6OOYt
	+QBUmAWyi28CxHR52caNgJVAdPMg3mBEBRbGJXaZzsD6ynLlnd0i80Ma
X-Gm-Gg: Acq92OFbJ4+IwEx4j7V6PzmsqFnZ+1RKDQVGyqq/VC6vybW20ijN2cGT2sm8HXgVJeW
	rhmNOFky5IaAK9WfOWQsxotKHdZAZEkCTCFZsyLBpSOyRk7AGDpmN6tDjw+2eci6DTtvqKQxXIk
	mj+ic8kxughMQZxvZGXcFr+z0fFcfNjmWkiALQ9RTH4DpNlpevkdwS4hj22r2aqXk8jcUYoytOC
	Da57uC5PvRvECy51ujlA39+ZGPPENMFxjjRb3pjt6PRL/Cm2PE64R0HPt7Nyovk7cgdwFziar3D
	qPkilIbVIu4ilVfFLbjpi+WR/M5uz4ktER+p9NwJ5MlJ5lOiteNzbJxlOqH2pW164HZSeoRbcRi
	CFrrs5IZ3U5EPxD6jlNfXm6WRWvgcEI0PZBfq68FUluD0hg/UBmacoU1okvkcjGvw0C1wtvdDNH
	VAN5KqRq1odDnunbCEXBrDwNjH2Zd3ymoOm9ARZ0lIS2X47I9pYGaGgaexRwsJgeoxCdiyfYPuc
	Kk=
X-Received: by 2002:a05:7022:2223:b0:135:d76a:aedc with SMTP id a92af1059eb24-137aeee5faemr536827c88.33.1780033026219;
        Thu, 28 May 2026 22:37:06 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e169:a62b:d3ca:e8c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b2d04287sm832719c88.0.2026.05.28.22.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 22:37:05 -0700 (PDT)
Date: Thu, 28 May 2026 22:37:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Christian Lamparter <chunkeey@googlemail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, linux-wireless@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 02/10] [v3] input: gpio-keys: make legacy gpiolib optional
Message-ID: <ahklyAUMaOxy3Z9X@google.com>
References: <20260520183815.2510387-1-arnd@kernel.org>
 <20260520183815.2510387-3-arnd@kernel.org>
 <CAD++jLnYeh3GfEfNXfCYdcdg_j2RAU63TYewwaTx3tm0tM531w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnYeh3GfEfNXfCYdcdg_j2RAU63TYewwaTx3tm0tM531w@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14819-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,arndb.de,googlemail.com,sipsolutions.net,iki.fi,kemnade.info,baylibre.com,atomide.com,alpha.franken.de,physik.fu-berlin.de,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,broadcom.com,lunn.ch,davemloft.net,google.com,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[40];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5FDE65FD698
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 10:57:44AM +0200, Linus Walleij wrote:
> On Wed, May 20, 2026 at 8:38 PM Arnd Bergmann <arnd@kernel.org> wrote:
> 
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Most users of gpio-keys and gpio-keys-polled use modern gpiolib
> > interfaces, but there are still number of ancient sh, arm32 and x86
> > machines that have never been converted.
> >
> > Add an #ifdef block for the parts of the driver that are only used on
> > those legacy machines.
> >
> > The two Rohm PMIC drivers use a gpio-keys device without an actual GPIO,
> > passing an IRQ number instead. In order to keep this working both with
> > and with CONFIG_GPIOLIB_LEGACY, change the gpio-keys driver to ignore
> > the gpio number if an IRQ is passed.
> >
> > Link: https://lore.kernel.org/all/b3c94552-c104-42e3-be15-7e8362e8039e@gmail.com/
> > Link: https://lore.kernel.org/all/afJXG4_rtaj3l2Dk@google.com/
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>

OK, if Lee Acks MFD changes I can pick this up.

Thanks.

-- 
Dmitry

