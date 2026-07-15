Return-Path: <linux-mips+bounces-15907-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rJuyJSQkV2pWFwEAu9opvQ
	(envelope-from <linux-mips+bounces-15907-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 08:09:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E906C75AD82
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 08:09:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p98vovTq;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15907-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15907-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84E8630103B5
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 06:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A8E317155;
	Wed, 15 Jul 2026 06:09:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956203093CF
	for <linux-mips@vger.kernel.org>; Wed, 15 Jul 2026 06:09:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784095754; cv=none; b=iW/9h/QVQtT3GCNLP34rYCB3TF8qBw+UGpIzNTv/ivwsrx4MdBU0BDdYBK32dTbNu6t69QAXk3NGDDTCzT5FfNi70trB6t8IcnXZy95p2Jz1fPnB73Vf68lrDkARttl2WUDmG6kli3qs4WQdJZpJPqKFjZNB49m6uF2+3AQFOQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784095754; c=relaxed/simple;
	bh=hhbkVFWqfeb6wr5PFPqn4mpOBnm0ya1NeenK6+bGYOw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Woo/CsLe4SZT7DcmeRVkUJvmgP6oGrbcsXDOr3a0unQz41ietaA8MT2Hw6oOp7qgb3mWsSEadGPQ9NUQevmn6wYqz/duJ2KtIUkv0F06/xuqruVWYg9VQ7PcFf5DrG0RVDLdIVSE3TmoSPwRKnKFqXJKT2P3nmygcnxiHCOPA7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p98vovTq; arc=none smtp.client-ip=209.85.215.178
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso3011287a12.0
        for <linux-mips@vger.kernel.org>; Tue, 14 Jul 2026 23:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784095753; x=1784700553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Lh6JTO9nCo+UydcGPYZiKr3ZrK/RHTWgrneFQPjvC0=;
        b=p98vovTqCJiVS+/z5CqVZwUFLuNTPWVFLz9Ld4ZxXvW0AH9F5nT90AIGkcyjQqbAvE
         PASg/wdzsyMU7lnzpHm6BoE0DJ2VoqAKjt0Y3wJjS7TdhzH9wXTewkRuSOB63KnZjwVZ
         8XUxdjum+xiyAv9m1uWVcBg+GjWdRprCmwKG7tBvMq6ySwl1WTtnUFg5KSSB+gkx2KRv
         OJsipStecCXuFjBT5OPQtcjuWlzrMwIMK7ZWFaNSmY/25iCGDKi7kY73PNF8TfMOhgQt
         EpAhjB18oj2rVDV8HQRS9Z2m4jAr0AST5Qg2iLxV+/bM6z4D/J5F93tD6ps+A+T+jd+P
         EkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784095753; x=1784700553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Lh6JTO9nCo+UydcGPYZiKr3ZrK/RHTWgrneFQPjvC0=;
        b=SyhnMWIaSa+ky7U+5RD5sb7uw5/cHXPnaFBlrppFI9NYReFE417K9x1pkt6qsKMG6P
         fpUnl0D0NNgYODRV0O8nNQxADcVoESFlbLBLPVZlKWqW9w9jaJ7AXb2Lm4+y/qVwzZ2E
         K2IFqjLhIWYvl0KKnu9yF5QI5oofoyfS4hF7fgY/Xh7OKFfM7jY3KdZOhVmD5P+dvd84
         W7NGieRTbJQDn6//FpQeVNvmUuBCio1mWyO7NLADDYNGkKDySnNyowk2amX9U7OhNZ7w
         75s2RtseMDnqB30tCqPmU0YqubHg32EHVyuLHUnWatGZGEGklZgsW1jYkJwGMuqD5pFn
         19lw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/gdGFOfEE8I+ma9Rh1dYq602vcbggx3WM6R5GEQs5KUH6po2nFJKPzA9eHnwZPc0SZnOx7h6TffFr@vger.kernel.org
X-Gm-Message-State: AOJu0YzmtNe6F9FVQGVVt38tORFF4AB4/xll+LEgY9++KwBuX52SlPVp
	UsMgLRFV8yJpXILA8ttIQtKAdF6QR2omqPkmR2YCNKxHT5EhU7qq4949
X-Gm-Gg: AfdE7cndLrRVIM4UQqDff8HwpXwGZp5gUnkj28ieWLzJ8kePLjewxJwck6N8RCPw0n1
	QgVhxy9wDyVbOLKpj/B4qsoWqG46dTf2y8t8Vg99KvQWmOKH8j/N3PBMv/9dmDYdNWwd6wo8kOW
	J+WisyUQyq4Hz4kRiiIad2/RX/At0f364wdQlb9KdKiorcaXTzpmkkeSaGeCJqUhZhH/cvlvo3m
	+pcP2sIuePg9j6YX65vf3sEbsjkKzbGHVJxvwZqs4XwlzLRzvt+eeiM+37lxv1L/3heIp6kc/HJ
	YgtQdf+wKA7atxSem99mNVXUZ/scXu/gpHjEygm3i6OLqF3dSa4/A9cF+TB5RPj4YDmqFlwpxWq
	GwMUJayrifI4d8+llgAJIH/C1PhksI5zmoojVltVa1FNmZQ2P8h2M98QnCsLqL2dEtNySn3+3mB
	LDJlzOXDquprqB6AgVtUPgOKd60aGPCsZX1mx8DIfXzSTOQ+D8wL0=
X-Received: by 2002:a05:6a21:7905:b0:3c0:9c18:d5a1 with SMTP id adf61e73a8af0-3c35725cfb1mr4795350637.62.1784095752812;
        Tue, 14 Jul 2026 23:09:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:93:a597:7931:c950])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm63352902eec.24.2026.07.14.23.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:09:12 -0700 (PDT)
Date: Tue, 14 Jul 2026 23:09:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Michael =?utf-8?B?QsO8c2No?= <m@bues.ch>, 
	Hauke Mehrtens <hauke@hauke-m.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Waldemar Brodkorb <wbx@openadk.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] MIPS: BCM47XX: convert buttons to software nodes
Message-ID: <alci_45CzdVznaN2@google.com>
References: <20260713-b4-bcm47xx-swnode-v2-0-2b879f0c193c@gmail.com>
 <4a8d64e1-5f8c-4ac0-afb0-2d68c3f53ada@app.fastmail.com>
 <ala9C6XMB3-ywpph@waldemar-brodkorb.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ala9C6XMB3-ywpph@waldemar-brodkorb.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15907-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:zajec5@gmail.com,m:m@bues.ch,m:hauke@hauke-m.de,m:tsbogend@alpha.franken.de,m:wbx@openadk.org,m:brgl@kernel.org,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[arndb.de,gmail.com,bues.ch,hauke-m.de,alpha.franken.de,openadk.org,kernel.org,vger.kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E906C75AD82

Hi Waldemar,

On Wed, Jul 15, 2026 at 12:49:47AM +0200, Waldemar Brodkorb wrote:
> Hi,
> Arnd Bergmann wrote,
> 
> > On Mon, Jul 13, 2026, at 23:58, Dmitry Torokhov wrote:
> > > This series converts the legacy gpio-keys platform device on BCM47XX
> > > boards to use software nodes and static properties.
> > >
> > > To do this properly without relying on legacy name-based matching
> > > (which is being removed from gpiolib), we introduce and register
> > > software nodes for the underlying GPIO controllers (BCMA and SSB)
> > > and reference them in the button properties.
> > >
> > > The first two patches add the software nodes to bcma-gpio and
> > > ssb-gpio respectively. The third patch performs the conversion
> > > for the BCM47XX buttons.
> > >
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > > As Johannes mentioned on v1 this best should go through MIPS tree.
> > 
> > Adding Waldemar to Cc. He has recently done some work to
> > get this platform working again in FreeWRT and should
> > be able to test your patches on hardware.
> 
> I normally use LTS kernel on the hardware (Linksys WRT54GS v1.0).
> But for testing I updated to 7.1.3. Attached is the dmesg without
> Dmitry's patches.  Button works, I can go into failsafe mode after
> pressing the reset button on bootup.
> 
> With Dmitry's three patches applied I directly getting into failsafe
> mode without pressing any button. Dmesg looks similar, but I get
> following kernel message:
> platform gpio-keys.0: deferred probe pending: gpio-keys: failed to get gpio
> 
> Looking at /dev I see no /dev/input/event0 device node anymore.
> 
> Attached is the small failsafe script I use on bootup.
> Hope this helps.
> 
> Do I need to change my failsafe script for the new stuff or is
> something else broken now? Do I miss some new kernel config option?
> Or is the patch only for latest Linus git repo.

Thank you very much for testing. I think 7.1 should work. Could you
please apply the test patch below and send me new dmesg? Hopefully I'll
be able to figure out where I messed up.


diff --git a/arch/mips/bcm47xx/buttons.c b/arch/mips/bcm47xx/buttons.c
index 151a4ee2803f..72524dc390dd 100644
--- a/arch/mips/bcm47xx/buttons.c
+++ b/arch/mips/bcm47xx/buttons.c
@@ -521,6 +521,9 @@ bcm47xx_buttons_add(const struct bcm47xx_gpio_key *buttons, int nbuttons)
 		return -ENODEV;
 	}
 
+	pr_info("XXX: bcm47xx_buttons_add called, bus_type=%d, gpio_swnode=%p (&ssb_gpio_swnode=%p)\n",
+		bcm47xx_bus_type, gpio_swnode, &ssb_gpio_swnode);
+
 	/* 1 node for gpio-keys device, 1 node for each button, 1 terminator */
 	const struct software_node **node_group __free(kfree) =
 		kcalloc(1 + nbuttons + 1, sizeof(*node_group), GFP_KERNEL);
diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 869228a65cb3..20f89e6a57f6 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -561,8 +561,11 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	else
 		return -EINVAL;
 
-	if (!refnode)
+	if (!refnode) {
+		pr_info("XXX: software_node_get_reference_args: refnode is NULL for swnode=%p (%s), fwnode=%p\n",
+			ref->swnode, ref->swnode ? ref->swnode->name : "none", ref->fwnode);
 		return -ENOTCONN;
+	}
 
 	if (nargs_prop) {
 		error = fwnode_property_read_u32(refnode, nargs_prop, &nargs_prop_val);
diff --git a/drivers/ssb/driver_gpio.c b/drivers/ssb/driver_gpio.c
index 87922479946c..28de62a42140 100644
--- a/drivers/ssb/driver_gpio.c
+++ b/drivers/ssb/driver_gpio.c
@@ -238,8 +238,10 @@ static int ssb_gpio_chipco_init(struct ssb_bus *bus)
 	chip->to_irq		= ssb_gpio_to_irq;
 #endif
 	chip->ngpio		= 16;
-	if (bus->bustype == SSB_BUSTYPE_SSB)
+	if (bus->bustype == SSB_BUSTYPE_SSB) {
 		chip->fwnode	= software_node_fwnode(&ssb_gpio_swnode);
+		pr_info("XXX: chipcommon chip->fwnode set to %p\n", chip->fwnode);
+	}
 	/* There is just one SoC in one device and its GPIO addresses should be
 	 * deterministic to address them more easily. The other buses could get
 	 * a random base number.
@@ -444,6 +446,7 @@ static int ssb_gpio_extif_init(struct ssb_bus *bus)
 	if (bus->bustype == SSB_BUSTYPE_SSB) {
 		chip->base	= 0;
 		chip->fwnode	= software_node_fwnode(&ssb_gpio_swnode);
+		pr_info("XXX: extif chip->fwnode set to %p\n", chip->fwnode);
 	} else {
 		chip->base	= -1;
 	}
@@ -481,8 +484,10 @@ int ssb_gpio_init(struct ssb_bus *bus)
 	 * one SoC instance in the system, so there are no concerns with
 	 * registration conflicts.
 	 */
+	pr_info("XXX: ssb_gpio_init called, bustype=%d\n", bus->bustype);
 	if (bus->bustype == SSB_BUSTYPE_SSB) {
 		err = software_node_register(&ssb_gpio_swnode);
+		pr_info("XXX: software_node_register(&ssb_gpio_swnode) returned %d\n", err);
 		if (err)
 			return err;
 	}


Thanks.

-- 
Dmitry

