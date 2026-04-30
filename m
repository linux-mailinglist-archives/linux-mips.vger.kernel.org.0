Return-Path: <linux-mips+bounces-14398-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFrUOdBC82nMywEAu9opvQ
	(envelope-from <linux-mips+bounces-14398-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 13:53:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B0B4A266E
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 13:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F30F300622B
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 11:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4B83FB073;
	Thu, 30 Apr 2026 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIvyPGJa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B793C73CC
	for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 11:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549645; cv=none; b=h+haUFXn+Heus8mG+0ZOdm6l/UyrP7MtcmCTYUu5f6m4rLx4b1845DzIkPrvNHX8xWz/qcVQJ0itYAs/Bsan9E/EJsu+Pq1pKAyRn5FIpSszHM47mZszhZoqK5WKsCmJbKj+xSa5d6kNr841v+T0iURNvYbFV42Z3AVk3tDi9lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549645; c=relaxed/simple;
	bh=iGx5Qxin/x/d8FSFv0TJ9Oh1GbI3pBKOPjLHQVLbJv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwdlDhGP+TeZl6GCLuprxqP0niKDHfNdysfwU9hkKP57jaT8mGJto5wAoOlDe7fF0n89vjVssz3pPhRgozSzNH99hu6GEnTN2N5cRQdsfzWDqN0nfHwT13DqYQQyVZ0OiKXTGNX2TQGlntigCcTT1JNXRT9lCm6VHTNwGAmTcqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIvyPGJa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED082C2BCC7
	for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 11:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777549645;
	bh=iGx5Qxin/x/d8FSFv0TJ9Oh1GbI3pBKOPjLHQVLbJv4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IIvyPGJanaXBFwynmKTFGcyEtZRdICIpMA1DUsC/zLXKYlLCditi2WhjrdyEhgu5C
	 4BCPW1E4fFARoxGYZvej9NizZqAu9/cwhyxQVmmbgB+HD+7f8F4AX392mUpIh/Ncuz
	 Ei1pdf3iuOp6YgebiaftqyhhCOIhA+qXsezXsEaJapVItwqojndAwsfWiGxMfUcsk0
	 Xiz2MDmsFymeq1NXKjoRHoO8ODdfMuWxFur0RvEWRI+xMjlihwqk697WhqsW1C0rl0
	 HLKlmxBxILto7oum4XQWyg/g9VA+jjGU9VfCMGpPqgpGVN9ovL09qnfvSdGj+eyNzL
	 p7sKe4wGuFTNg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38dfb789d7fso7356681fa.2
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 04:47:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/kjzmy94coPX5WId0UBwRINQqvgu+wkYSb6bnmUA2lECOmPLFb4ftSpZOGWXPSOmeF+HwcItdx82n6@vger.kernel.org
X-Gm-Message-State: AOJu0YxPTTLEK/nD6EdMGrEjrQ7shWze6hd2mEFXv1OfqEFFqaBFCW97
	wVeWHCGzaWAAY8DsVxcqudcIt5sGIhdNFthbzrHBFVdQpQJV1zTiifBlto60CfV3H4wf26+XeTa
	mvEEEdm7kWh1vKbHMSe8xMGmnScMByQo=
X-Received: by 2002:a2e:bc85:0:b0:38e:dd8e:d213 with SMTP id
 38308e7fff4ca-3934e305186mr9183771fa.27.1777549643607; Thu, 30 Apr 2026
 04:47:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-mips-rb532-gpio-v1-1-845a0c6206a5@oss.qualcomm.com>
In-Reply-To: <20260430-mips-rb532-gpio-v1-1-845a0c6206a5@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 30 Apr 2026 13:47:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBmnvL0FMFdCc-sto10vqRs6wpXuGTme4cvH2vTZzg6g@mail.gmail.com>
X-Gm-Features: AVHnY4LxJ8UlojOse9ev0HTb80-8fB240GLr68HzwsJhwKmVSDSpoPLj1b8DwU8
Message-ID: <CAD++jLkBmnvL0FMFdCc-sto10vqRs6wpXuGTme4cvH2vTZzg6g@mail.gmail.com>
Subject: Re: [PATCH] MIPS: RB532: attach the software node to its target GPIO controller
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 22B0B4A266E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14398-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[alpha.franken.de,gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]

On Thu, Apr 30, 2026 at 1:23=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> GPIOLIB wants to remove the software node's name matching against GPIO
> controller's label that is going on behind the scenes in software node
> lookup. To that end, we need to convert all existing users to using
> software nodes actually attached to the GPIO devices they represent.
>
> In order to use an attached software node with the GPIO controller on
> rb532: convert the GPIO module into a real platform device, provide
> platform device info for it in device.c and assign the software node
> using its swnode field.
>
> The software node will get inherited by the GPIO chip from the parent
> platform device in devm_gpiochip_add_data() as we don't set the fwnode
> using any other of the mechanisms.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Looks good to me (TM).
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

