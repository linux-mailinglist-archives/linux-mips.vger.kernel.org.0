Return-Path: <linux-mips+bounces-14876-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ND3HFJxIWoGGgEAu9opvQ
	(envelope-from <linux-mips+bounces-14876-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 14:36:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDF463FED4
	for <lists+linux-mips@lfdr.de>; Thu, 04 Jun 2026 14:36:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=e1ErmNFN;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14876-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14876-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6933309C8EB
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2026 12:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1507472780;
	Thu,  4 Jun 2026 12:34:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9310F44B662
	for <linux-mips@vger.kernel.org>; Thu,  4 Jun 2026 12:34:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576461; cv=none; b=WGxLvnRC2DvTOkKtC/5r0p6pIP552919/8ylm7zko9X5BXoKRPDDEF6osYrcnwUXSh5iAyeFi3bm4bbZxv+WWHZzzXL9a4FPqQJZ8By13ht7JzrisYG0dOt7EdY38VzJkJwdA2JaguIMN1OX3VVbKTWwc9uf7Kq8E20tNArR9DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576461; c=relaxed/simple;
	bh=tRdKfjnRUz0aPl6PAEFjMNJL5WVJkUOwzH0txEdO+/Q=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UedlQ0aJ9HDgX3w0PwKEcZgAh2VZ6MwKAk3z2Oja2L38AHEfUIcjlqkmkSKDtc+VeZ0BYhsawVJVDP8WiTZ0GpgnOEtgR0l1JA7lCuZ0VGxIykCfQzthE+9Ze3ghF9gThlKFvqaF4rJFLb+4YbUCbmQnDU+AA8NQguinD/D3V8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1ErmNFN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F031F00A20
	for <linux-mips@vger.kernel.org>; Thu,  4 Jun 2026 12:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780576459;
	bh=kQ6M6FDKXPf9y7Y2G+ZlFRRaP5oLHz23vLbG+bNrvo8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=e1ErmNFNc3B2GEwYqb/P6xaZrlvHojwGUKOx+yleFIv+SrequIqnOzpFPLS1QoJOu
	 M6UveWB9G9jMFR2xQgcuoOfCqwtUFLxtREEtbjlRtcR8Oiz300JksvjDpoAiEHZWl5
	 DK4tJNSy64M+EydtbLB3r3qwSx6AoeXlzSDvlHLB9/hX0rPhEzKIn8xc9Bfw8dWGhh
	 8YQLs+n/OsaOYQD5t+KUjWzIRs9cKpu34ToF65wYvg8QcIy+50z8yHU8exS3cwA7GT
	 lIqRVAp3Dz2GuvmZ2qOOkeo5ggbyFzMytBjaNxsOZHoXJpBb89z7x9cipR7tV9C/DW
	 ReyLRDqG/Vt9Q==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3965d76090bso5398191fa.2
        for <linux-mips@vger.kernel.org>; Thu, 04 Jun 2026 05:34:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8BaWe6Fpdl0evjDhFnVl1y3xLxx9EYvk3f5Ta2v0yuJvIBU/T3Z3rSSPbYLatIHFoqfNFqBtpUfsUV@vger.kernel.org
X-Gm-Message-State: AOJu0YwdUUfVtXPh0pxs1yqjMZ+sJaxsYOO7iBxDZdK5exoXqjbKUQO/
	T7+yB24nLt+Fxo1ENOn1JDX8lgZFrjj2Ovey9HD/KtvqQ4Y9GWRwRbm6sqwcefctYDMor9qa9sh
	OflG9a8ze55ZiyT5/mRk4Ei+n6qk5y7vbRE/+5RlD2w==
X-Received: by 2002:a2e:bcc1:0:b0:396:8eb1:a4a4 with SMTP id
 38308e7fff4ca-396af436443mr25706941fa.14.1780576458112; Thu, 04 Jun 2026
 05:34:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 08:34:16 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 08:34:16 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ah9P6Xt9SyKgc2oJ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
 <20260521-pdev-fwnode-ref-v1-20-88c324a1b8d2@oss.qualcomm.com> <ah9P6Xt9SyKgc2oJ@ashevche-desk.local>
Date: Thu, 4 Jun 2026 08:34:16 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdhjZhGL9tEx9WEjn2f95d=ObNM0AtBNpcevm6aHgpj+Q@mail.gmail.com>
X-Gm-Features: AVHnY4IaL6Srer7kIaxoyyrYpvf7EUQjky2qCo2_J16coVWA1ajpEEsVM7UfQA8
Message-ID: <CAMRc=MdhjZhGL9tEx9WEjn2f95d=ObNM0AtBNpcevm6aHgpj+Q@mail.gmail.com>
Subject: Re: [PATCH 20/23] usb: chipidea: use platform_device_set_of_node_from_dev()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, 
	Thierry Reding <thierry.reding@avionic-design.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ulf Hansson <ulfh@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Peter Chen <peter.chen@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	driver-core@lists.linux.dev, devicetree@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,linux.intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,lists.infradead.org,lists.freedesktop.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-14876-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[66];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CDF463FED4

On Tue, 2 Jun 2026 23:49:29 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Thu, May 21, 2026 at 10:36:43AM +0200, Bartosz Golaszewski wrote:
>> Ahead of reworking the reference counting logic for platform devices,
>> encapsulate the assignment of the OF node from another device for
>> dynamically allocated platform devices with the provided helper.
>
> ...
>
>>  	pdev->dev.parent = dev;
>> -	device_set_of_node_from_dev(&pdev->dev, dev);
>> +	platform_device_set_of_node_from_dev(pdev, dev);
>
> Why do they even do that? Do they have a USB connected pin control?
>

I don't know. I can't test it so I don't want to break it. If they don't need
it, the person who can test it, can remove it later.

Bart

