Return-Path: <linux-mips+bounces-13290-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED67N77RoWkfwgQAu9opvQ
	(envelope-from <linux-mips+bounces-13290-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 18:17:50 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE031BB528
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 18:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E30373124DC2
	for <lists+linux-mips@lfdr.de>; Fri, 27 Feb 2026 17:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A10352C5C;
	Fri, 27 Feb 2026 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGRawu6M"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D57E35B645
	for <linux-mips@vger.kernel.org>; Fri, 27 Feb 2026 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772212492; cv=none; b=Cl733xQ28J25Hcn4qHfpCy955iwSRbvHVIhQYv2aYBKWC20Dqs/qggUq375+SQIdY7O/mZ1PmJ/qy/v6yqhiQ1++I4MhSjxWH8wPbV1HRnOTSfDrkA3mV6stn56cP0Fp3HViyjQmULlQlHM99dlapudJpmpMjF18YvJFaLIGHIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772212492; c=relaxed/simple;
	bh=mjJ3rgoN+5baKF6IVDj3Zss9SsM7yzwd+Fk7+K7zMHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUYZ685FXkpE9udxTVxaPYzAtC24OB7rkUS8hR4WMcTslYepdLvWix2weWAKO+V8hQNtsefTCKaTaq6l6y3a3HXDbZBJLp83lUbVAYfbzT6Ix5X0o0+psQA1hLp/2/oRnJ7HBQr82qlh3inRGJ7VDEON/2Ne78wB3iSsxg+rRv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGRawu6M; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4398d747f7cso129149f8f.0
        for <linux-mips@vger.kernel.org>; Fri, 27 Feb 2026 09:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772212489; x=1772817289; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FmUltvU54hbRRy0xFqpsv0WciP4Yo3wnOvw1sK4/T7k=;
        b=RGRawu6MYVQJnbozirQWPpU6lLxIDqTmr5IB92GPjfhQrBkz8FppO5lraDbgqdAJ/t
         nB3hhlUuSyEDm7r1BXBCtKpLOYYJytb0xXcHYB+5XQC7Jx63I7xE0xY6amsrYEuLt94W
         ZN/4+hSEsAN4K3V97AhAoCkIi/hzHPq0AGYm8zZq/Z7QMWvCs+k8fbsqOLX6QNoAltTY
         4HQ+4dgCdHvw/RSIwzDNc4L4VwjKaxA94EKPz6QRVpg4Y8TmGTS/6kEzbqfzQ5qz267g
         dQF8bAm9Le4ihp441EkUu3pds2PvhBnKsTB7MVPaUrl+Cty4RthfEQmeYWOShwGlE8rc
         bHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212489; x=1772817289;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FmUltvU54hbRRy0xFqpsv0WciP4Yo3wnOvw1sK4/T7k=;
        b=mWkuDyxac1q4v8AHTD0WYJgODBETHvRFfxIYcufRtZKE9MuzsffCEdTsJ0lKxoiaLr
         dAxf5gLvUrE1HAQRvwIj9Kx+VQjghwGhfIVuH9NjA8wMrrGrawbtBOf4qylYmJjSYSFi
         rg+QbJQOzpeGfE9O9eECDF1Momu+AW3jzvoSGpXE4f+XioRSx1Ew7dEDKkRjLSmD/NZK
         zehC8jqbdKl7OQNrJG1sdh1gObu6dgQfg3FgBvdBKkC34K8vqtGkvcJRUkTiZVVg0iBb
         dH1AT0JWhJb/g5G4X8nbFQ4G2c7pKEG7o+Gf4hd6vp/yV2uwd+4nMZpOM9P9dTL0uU32
         PHsw==
X-Forwarded-Encrypted: i=1; AJvYcCW2kVX0tDM3k1Y0TUg22g6uaWvELGKhHncgRziZhSCrZ2MrpkqyEfd+Zrrs+6+dLgPbrDymo/W/Lb/X@vger.kernel.org
X-Gm-Message-State: AOJu0YyHMLE0QCDgCq+LpIiNPmCuvDbhM6Ots/f6jKZCkeP+Xcs1yvjc
	3V/20WVG3Y+A7ufR3XKDychGRBziqDhnrUsS1VasyG5djxeoE7NnpsjT
X-Gm-Gg: ATEYQzxJ/zVIaNVDXx09Oz0/wmNKH/G7NEMQkrWF5aWA0gwej8CH79RCzbY8uUx4KeE
	9mX3jjhoL41cCJszS32ILPnRbtat3umfH/OJMMq7FRFQQYkOzLXhQnq/PiUam0SX5I/VMUFYSn3
	UybdNB/GoikIq8EKJ1nJocW7ECvHsN+xq9D8+zFAbM0PYLHpqydmVXUiO8mGzmhINnnhP2msLnf
	HPurqHxETpwxoG+RcrBygPfsbZBN2XYU1wXPssyzNfwaN4F80RaG+HfnxfWzzmICKxTAEdNYpVx
	ipzlP4ZGnDySozot2uMRC1jaOMxmsh4XuDmilszSk2APw3xEnlXUyor2p4sSi/KQ9kinw4k37eE
	w4f12RZtkk6/U/5NH52SB8iYdIGqIQHhaZKTBY6JwSqNRmZXzI2WYtsLLOy7KWVkuQtr75KGPt/
	KimZBCdwIuOp7UCW9C7BO7iN7aZ/xS
X-Received: by 2002:a05:600c:3493:b0:47d:3ffa:9838 with SMTP id 5b1f17b1804b1-483c9b999e0mr31630165e9.1.1772212489064;
        Fri, 27 Feb 2026 09:14:49 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb8724bsm85551835e9.11.2026.02.27.09.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:14:48 -0800 (PST)
Date: Fri, 27 Feb 2026 19:14:46 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 2/2] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Message-ID: <20260227171446.mqygrv35s5jdae46@skbuf>
References: <20260225-macb-phy-v7-0-e5211a61db56@bootlin.com>
 <20260225-macb-phy-v7-0-e5211a61db56@bootlin.com>
 <20260225-macb-phy-v7-2-e5211a61db56@bootlin.com>
 <20260225-macb-phy-v7-2-e5211a61db56@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225-macb-phy-v7-2-e5211a61db56@bootlin.com>
 <20260225-macb-phy-v7-2-e5211a61db56@bootlin.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13290-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7DE031BB528
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 05:54:41PM +0100, Théo Lebrun wrote:
> +static int eq5_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> +{
> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> +
> +	if (eq5_phy_validate(phy, mode, submode, NULL))
> +		return -EOPNOTSUPP;

Propagate the phy_validate() return code, don't generate your own.
-EINVAL should be preferable to -EOPNOTSUPP, so that callers can
distinguish between "phy_set_mode() not implemented" and "phy_set_mode()
failed".

(yeah, phy_set_mode() was made optional a while ago, IMO incorrectly,
but that's another story)

> +
> +	if (submode == inst->phy_interface)
> +		return 0;

I think this simple comparison fails to serve its intended purpose
(avoid PHY reset when not changing modes) for RGMII modes, of which
there exist 4 variants.

Maybe:
	if ((phy_interface_mode_is_rgmii(submode) &&
	     phy_interface_mode_is_rgmii(inst->phy_interface)) ||
	    submode == inst->phy_interface)
		return 0;

Does the EyeQ5 platform support internal RGMII delays? If yes, which
layer enables them? The Generic PHY?

> +
> +	inst->phy_interface = submode;
> +
> +	if (phy->power_count) {
> +		eq5_phy_init(phy);
> +		return eq5_phy_power_on(phy);
> +	}
> +
> +	return 0;
> +}

