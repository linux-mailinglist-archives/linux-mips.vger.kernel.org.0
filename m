Return-Path: <linux-mips+bounces-13210-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCw6ECABn2lAYgQAu9opvQ
	(envelope-from <linux-mips+bounces-13210-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 15:03:12 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBE61987D4
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 15:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CCA33027042
	for <lists+linux-mips@lfdr.de>; Wed, 25 Feb 2026 14:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE613B5311;
	Wed, 25 Feb 2026 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cehSiZtT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47053284880
	for <linux-mips@vger.kernel.org>; Wed, 25 Feb 2026 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028188; cv=none; b=ruZcRiRMTvoq7qG3hr347vebdYmOpfMPLoosLgKWaHQI67K4qDCcooM/DZBusQ99+aG7V7WQgCbHkWeLJPi0xfSwYLFi34HNmI2hwjwkoDzrUTzD+JFb+3mvmsK/gjhVHEgi91KBQ0qVjmGkzbnJlCZ0E1OZafd4i240jo5PHMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028188; c=relaxed/simple;
	bh=Wbxkai96KV++LHuFBYgeBqSwbkDv6oZ7clagX+nNyW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5bymEcnMfeijvi/ojpx9vN/bpRujWiRMdfFqlHZpGKMOikUrK4uKt9c5dtPoWu8KQRcj66auDRDYiqkOKzivm8sieQqJObS5tox02bI0jE/FlOemgP5CVdARKNb6KpkU/8ekNU6UU306t8vgEtxFAOYaiVSXDiHIk1ncuLTNLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cehSiZtT; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-65b9db5e4c1so787903a12.2
        for <linux-mips@vger.kernel.org>; Wed, 25 Feb 2026 06:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772028185; x=1772632985; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/X7TGnbDY8JHbzvNZLr4KocFzXXLBLgEWZOADNbBVWE=;
        b=cehSiZtTELhq9w7365ouxBfC+5t+oBMOkuMaCDTUF/eO7Vz7ykZGSaEhJi2DwYBpam
         rbhxaMuHO9jtEpxp95sk/sRiFAtTAcYxsV56Ue1su0kedWNsF3KdyKkuEKF+BGAWkgTK
         uRDjFh6ujNKJQ5CTtv2gYVZ+TuOLCEK+lIM5KvWbNjFbWpJfsaAQWcl+m3FUPIo80m+r
         WdiRoOu9htDehEAGVKejtEDNh9uMCIoNi+UvlibTiY2EBk517VqQWZwtuJT+CIVaP1rh
         ASVH69t7gjF/y0loTo2WtL56hnFiMqKyk/gMwhzQySG1DUVG8Cj8E6xmA5UuTkdq5dtC
         43pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772028185; x=1772632985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/X7TGnbDY8JHbzvNZLr4KocFzXXLBLgEWZOADNbBVWE=;
        b=otND7rdH2NKVpsMQttOMHtU+UaghQWrLStXZXsIl6wDMBWRS89qHwBnGU9iRarwl03
         R+aMFM58Vrlm/jl1q/yS5euQ2q05MjPfdSUzejIG6rNGB+XswxNhubxiu/ogNTDmT/Yj
         A8TMYS65CberEor80UYKf13J/8QL2OrlbFbS19Yb02M5wlsm6jFFf+UcEKFFho/mKMky
         OvWB0JHPs/RwX1Bj8Aq4MtU6TR4FOk+Dk7OEElrJZdCK1L2bFCK1R0533fBjkbS4t78I
         xk8uoUikCjkBrNvQD9bTYK0N2MLTsNAsIKzUR7sJojd90FDqqYsA9whUwtqteXzUMVY+
         Rj+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXMKZ87NaA2MTngEkBFCGRfiDdc0w5bHMqVRdJ5g2Ql/YgMpMzs7Xn0oEbFN7KwWSmBdOluiB6DZrz@vger.kernel.org
X-Gm-Message-State: AOJu0YzjNnfv20U6/mTHhHVQKaaeNZZZZ6LBUOHAfcsTeU+i9zuKXgjk
	Dxe/mtO1Dq+Eh5elBk91Rbt8AH5TFmpFLoBwhtJNFTq5EJpr3Evip9q3xmuzo3Y3
X-Gm-Gg: ATEYQzyKNP0yPUOSWIhLjNqvt22ypEMERNoWX7Hv7ccsmRXVNamjrucS45zQNoG0kpG
	HpXM+s5FzrRs1JfdlZ0LQFshg/TkbldLbhsKLnwtHd7xby0mcsCGjLtNNJxvVbGkpwlLShrrcUy
	uSBhj/MCx8hFVIfRUDUzeavfuPBg0I8hK9zASfRF+sL0V1Xd7fQIxr8OkhpkLHjPoSa9Wqa1FF7
	TaYqwBeHgY2DuG6K9OYp3K9NeHnIdZyVnRi+2L8Jv9Ibt97tBwie3KBTugv/9C/HJlwANmiKX6F
	+9Wu5eYIKw1khL1tCHohbmmAHQkaHoRIXf9lzVlOxhj1KOFDcHVO41vEa+UU6GnxTkL8PhcfBF4
	YAhWI0o0heTe6KYo/LE5FV8S6yqE3DGvKMTfgPFeMTeXNzvTz+UmcoSpr0csKLIzRfYJwpoBMHR
	ofLpt7kGKx5ix+9A==
X-Received: by 2002:a05:600c:6218:b0:483:702f:4639 with SMTP id 5b1f17b1804b1-483a95eabd7mr166023945e9.2.1772022593550;
        Wed, 25 Feb 2026 04:29:53 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:6e08:ea2c:b2bc:dea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm33655969f8f.6.2026.02.25.04.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 04:29:52 -0800 (PST)
Date: Wed, 25 Feb 2026 14:29:49 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?utf-8?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	=?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 3/8] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Message-ID: <20260225122949.pt55t3eefr5nawmu@skbuf>
References: <20260127-macb-phy-v6-0-cdd840588188@bootlin.com>
 <20260127-macb-phy-v6-3-cdd840588188@bootlin.com>
 <20260210193516.temrg46yozxma7xb@skbuf>
 <DGND4VXM9X0N.2CP1VBD8E128M@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGND4VXM9X0N.2CP1VBD8E128M@bootlin.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13210-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DBBE61987D4
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 06:20:21PM +0100, Théo Lebrun wrote:
> > Could you please add a macro or comment hinting at the origin of the
> > magic number 5 here? You could also place these 3 lines in a common
> > helper, also called from eq5_phy_exit(), to avoid minor code
> > duplication.
> 
> ACK, something named `eq5_phy_reinit()`.
> 
> I don't have precise explanation for the 5µs value; I only know it is
> time to let the PHY settle before further register config writes.
> Is this enough?
> 
>    udelay(5); /* settling time */

If there's a single occurrence and there's a comment, it's fine.

> >> +	      EQ5_GP_SYS_SWRST_DIS | EQ5_GP_SYS_M_CLKE |
> >> +	      FIELD_PREP(EQ5_GP_RGMII_DRV, 0x9);
> >
> > Quick sanity check on your proposal to use #phy-cells = <1>. This is not
> > a request to change anything.
> >
> > What if you need to customize the RGMII drive strength (or some other
> > setting, maybe SGMII polarity if that is available) per lane, for a
> > particular board? How would you do that if each PHY does not have its
> > own OF node?
> 
> I have no knowledge of what that 0x9 stands for, I didn't see the point
> exposing it to devicetree. We could plan for the future and add a cell
> or create subnodes, but here I kept it simple stupid. Is it OK?

If you don't know that you need to customize anything, it's fine the way
it is.

> >> +	writel(reg, inst->gp);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int eq5_phy_exit(struct phy *phy)
> >> +{
> >> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> >> +	struct eq5_phy_private *priv = inst->priv;
> >> +	struct device *dev = priv->dev;
> >> +
> >> +	dev_dbg(dev, "phy_exit(inst=%td)\n", inst - priv->phys);
> >> +
> >> +	writel(0, inst->gp);
> >> +	writel(0, inst->sgmii);
> >> +	udelay(5);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int eq5_phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> >> +{
> >> +	struct eq5_phy_inst *inst = phy_get_drvdata(phy);
> >> +	struct eq5_phy_private *priv = inst->priv;
> >> +	struct device *dev = priv->dev;
> >> +
> >> +	dev_dbg(dev, "phy_set_mode(inst=%td, mode=%d, submode=%d)\n",
> >> +		inst - priv->phys, mode, submode);
> >> +
> >> +	if (mode != PHY_MODE_ETHERNET)
> >> +		return -EOPNOTSUPP;
> >> +
> >> +	if (!phy_interface_mode_is_rgmii(submode) &&
> >> +	    submode != PHY_INTERFACE_MODE_SGMII)
> >> +		return -EOPNOTSUPP;
> >
> > Both PHYs are equal in capabilities, and support both RGMII and SGMII,
> > correct? I see the driver is implemented as if they were, but it doesn't
> > hurt to ask.
> 
> Datasheet indicates 0 can do SGMII/RGMII and 1 can do only RGMII.
> Did you imply that the driver code should reject SGMII on PHY 1
> if it ever gets asked for?

I didn't imply anything, as I didn't know the facts. But now that I do,
yes, I'm explicitly requesting you to reject the submodes that PHY 1
doesn't support.

I also notice that you haven't implemented support for phy_validate().
Please do so, even if your PHY consumer does not call it (it should, to
detect which modes and submodes are supported).

> >> +
> >> +	inst->phy_interface = submode;
> >
> > Short story: don't rely on the phy_set_mode_ext() -> phy_power_on() order.
> > Implement the driver so that it works the other way around too.
> >
> > Long story:
> > https://lore.kernel.org/netdev/aXzFH09AeIRawCwU@shell.armlinux.org.uk/
> 
> I wouldn't mind, but what should phy_power_on() do if no submode has
> been provided through phy_set_mode_ext() yet? Guess one? Fail?

Assume a default initial submode, and power on using the rules of that
submode. In your case you don't even have to assume, you can read
EQ5_GP_SGMII_MODE to figure out what the submode is at probe time.

> Also our PHY will need to be reset to change its mode if we do
> power_on() followed by set_mode(), which in practice is never something
> we want. Maybe there is a flag to indicate that we require a submode to
> power on?

Such flag doesn't exist, nor do I think it is desirable. It would
unnecessarily complicate consumer drivers, which would have to support
two code paths if they were to follow the "generic" PHY API model.

Feel free to reset the PHY if requested to change the submode while it
is powered on. For example, lynx_28g_set_mode() does that.

