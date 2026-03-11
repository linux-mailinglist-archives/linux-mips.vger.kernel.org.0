Return-Path: <linux-mips+bounces-13578-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N4IEU/GsWkFFQAAu9opvQ
	(envelope-from <linux-mips+bounces-13578-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 20:45:19 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 534EA269938
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 20:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96E3E3020FFB
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 19:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEF7372EF6;
	Wed, 11 Mar 2026 19:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L+CfdcCe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bAPhTRaq"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97584374E4F
	for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 19:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773258301; cv=none; b=A9dE3WqVx+pLFC4l0ZzVNQ3+8ZfzRQIZbHnvgcvtUkLiOQPWpGxL4/dwokshns6G/pB5yAUfDz17kyUI0HgHFKrPEhdD12pkpIWR0rr1IC2M3Ql+wyURDOPZbA2p3ul3mGYuqKNl2GdwSC9cKDZBeFbSmQDOppnYaAxpevbTpRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773258301; c=relaxed/simple;
	bh=bGzkEAlghozexdiJRNQPbgg3VMzti/9i5mXejNA+j0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVRtE0n/PjnjcJVRiB//TremFBf3V4d5arEeVC7NAVSUffAC0STyEJH0xzRM0qBUYL3WatlJhKp8R0seHmTy8a0NxVY2yiWONA4BehZ79bYOxJM1WV4nThl2V0umwuKpH2cNwsmfH5Q6MOEBi3+b6Hzo8097U5rwEvy6rzzBJaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L+CfdcCe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bAPhTRaq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773258297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GoMDbJU2xDFYUQd1hXlmSs8yylpms2iEAMhOVCgJXGI=;
	b=L+CfdcCeOIgy61TNFU5T+aW6l8qndL2Ms4m2y1393T6wSuQ543jko/ctLOsmpqpbQA/IAP
	6zbI950dgI6fJBLH/z/T33eZewTNcGTsxTV3JSUAFaYtQpLT41b3gWkxoXGhc6IT9ngHr+
	JYFCYQxkTGwLCLVtbMEo+GsdV44hMEs=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-2HMPWIKiOI6YkGhHfCvTDg-1; Wed, 11 Mar 2026 15:44:56 -0400
X-MC-Unique: 2HMPWIKiOI6YkGhHfCvTDg-1
X-Mimecast-MFC-AGG-ID: 2HMPWIKiOI6YkGhHfCvTDg_1773258295
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-67bcaf99fdcso3985325eaf.3
        for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 12:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773258295; x=1773863095; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GoMDbJU2xDFYUQd1hXlmSs8yylpms2iEAMhOVCgJXGI=;
        b=bAPhTRaq06k13ZPPQ8hzDtanAS+QqmhkIaMTPRDalkjyGVznFr4nYDazt9dbqVQosb
         6D2RiRH1k71wbkioxFPvFntAx2/aLhl4PUoEPY5MEsdf4ZFDmVs/RmTmElxRJ9G4vmAV
         F/XwMzi7bJDE4qOrd6ZmVOhY28YDN3NBMkbgCZsazRgUXJGBcVfvizI7o41FtJdg242f
         z6BLWzz+lFgv3DDda4NWwqLsh1IP7JXYPT5rGl42UTQIZzqG82EkiPtzu8zS9G38s5P7
         SDHoCZtQQCkERtYf4QsqWG19qtMfxgtB4MaLE3wx81iHUetJq0WyJjcRAo01qGdquPM7
         Ljig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773258295; x=1773863095;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoMDbJU2xDFYUQd1hXlmSs8yylpms2iEAMhOVCgJXGI=;
        b=tXQXGFU9LwaWs9yzomiWBcqrBKCSU12iO/lUS+d2TOVj8ib+lwMwYXbqn+7XpLShZu
         K0Bp5/wHuMU1I5NShiNILsRa8WBsk0nTfZDqe8JlbVeqjpSQWlodKKTc3aASZo3oaLwH
         GyZYSUOb88cHarTpIlnM5d+TRuIwMscXseGtCEsSLBu0CBKAYbchEw5d9bSpQ7jL3QGi
         9fGT0Vh7kfbr+TOFXOTn9xrSEVjhJ4OYRMmw5jNZOdYxvabQTZdujp0nYBlM7KxjDrzH
         qHM580GV1URbybb66C5a+q+e6CPBpYbllYhZSy9Lc/A6iL5JBzZ4shHAPO58nf+zPC5y
         gvRg==
X-Gm-Message-State: AOJu0YwhUiFJuhLWBOkZlvUHmKZEB/NzVexMO5zySmNTp8m7437+zRtj
	vO//Of/6w9LrUzOlX6W48rzot9gAFuKhHNqZLQ79N1PuFOgxWwcfC3G9+1PmKcOowRqPrlNXFkP
	PyNU0WS766whJ2dPHVO/iYQn6MQ7/OguHsns9W+iz6kRiBVmZgB1SDU3S9NsPVFI=
X-Gm-Gg: ATEYQzzHNiS3j9AHk/OtKSCpzDt1BimKedWbj8uuiC3FnZ6qy5I0gMdNlqFVwTXfGwW
	A2Rzbl2kSupgCzW3kd7IFaffYnehhbXswh6iJxOS/hAWLnUnA0Q/tjsB9n5w4DAfOt9a729dkNg
	9/yoDdrkEUi6CuQR60FPZg3fLE+Pdhr6JwCxDhhZ4t3HcEPTezoodWyF0BypmIbUmcNlcJaipuQ
	pLNxaHJZybBsZmCfIxeczGx642QnJoDSALNiAGuC6t3nt5ECmnJQFzIzUM4Yrx5iwk3bcEx3bRm
	wC8U3E+Ic2mjYK+ZtqVyZuW6CRux3CqdXzAa/bRaG1ILdERpJVEXLkDUwPWveUP73IbZvdkA6ng
	0AdIQSsO66w2fsZMgnRAT
X-Received: by 2002:a05:6820:468b:b0:67a:47b:5a1a with SMTP id 006d021491bc7-67bc8a92d45mr2060523eaf.65.1773258295395;
        Wed, 11 Mar 2026 12:44:55 -0700 (PDT)
X-Received: by 2002:a05:6820:468b:b0:67a:47b:5a1a with SMTP id 006d021491bc7-67bc8a92d45mr2060493eaf.65.1773258294899;
        Wed, 11 Mar 2026 12:44:54 -0700 (PDT)
Received: from redhat.com ([2600:382:7704:370d:c6a3:6b0f:aa31:6ca2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bc8efb85esm1894481eaf.1.2026.03.11.12.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:44:54 -0700 (PDT)
Date: Wed, 11 Mar 2026 15:44:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, nbd@nbd.name,
	ansuelsmth@gmail.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/8] clk: airoha: Add econet EN751221 clock/reset
 support to en7523-scu
Message-ID: <abHGMgGCyPh1G5jC@redhat.com>
References: <20260309131818.74467-1-cjd@cjdns.fr>
 <20260309131818.74467-3-cjd@cjdns.fr>
 <abF-qFC1Oa4dz-fh@redhat.com>
 <de6e8440-99a1-4be7-80aa-3645fdb0bdb9@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de6e8440-99a1-4be7-80aa-3645fdb0bdb9@cjdns.fr>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,baylibre.com,kernel.org,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-13578-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 534EA269938
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 06:12:59PM +0100, Caleb James DeLisle wrote:
> Hello Brian,
> 
> Thank you for taking the time!
> 
> 
> On 11/03/2026 15:39, Brian Masney wrote:
> > Hi Caleb,
> > 
> > On Mon, Mar 09, 2026 at 01:18:12PM +0000, Caleb James DeLisle wrote:
> > > EcoNet EN751221 clock/reset driver is significantly similar to the
> > > EN7523 / EN7581, however the EN751221 does not have a neat batch of clock
> > > divider registers so there are fewer known clocks, and the frequency of
> > > each clock is derived differently. This clock driver will probably work
> > > correctly on EN751627, EN7528, and EN7580.
> > > 
> > > Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> > > ---
> > >   static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
> > >   {
> > > @@ -604,7 +703,8 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
> > >   	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
> > >   	return en7581_reset_register(&pdev->dev, np_base, en7523_rst_map,
> > > -				     ARRAY_SIZE(en7523_rst_map));
> > > +				     ARRAY_SIZE(en7523_rst_map),
> > > +				     en7581_rst_ofs);
> > I assume the mix of en7523 and en7581 is ok here?
> 
> 
> Correct, en7581 came first, then when en7523 was added they reused the
> function. I'm only changing the offsets to be passed in because en751221 has
> more reset registers so different offset table than the others.

Sounds good. I just wanted to confirm.

> > > +	else
> > > +		clk_data->hws[key] = hw;
> > Should the error code be returned here? I know the function has try in
> > it's name, however if this fails, then it still registers it.
> 
> 
> This function follows the general pattern of en7581_register_clocks(). If a
> clock can't be registered, leave clk_data->hws[key] as NULL, log, and
> continue. There's only two possible reasons for failing, if
> clk_hw_register_fixed_rate() fails then it's not registered because it
> failed. If key >= EN751221_MAX_CLKS, it does register but I'll fix this so
> it's checking that before clk_hw_register_fixed_rate().

I see that Stephen picked up this driver in 2022 with that behavior. I'm
fine with it if he is.

> > > +	/* BUS */
> > > +	rate = FIELD_GET(EN751221_REG_BUS_MASK,
> > > +			 readl(np_base + EN751221_REG_BUS));
> > > +	rate *= 1000000;
> > > +	en751221_try_register_clk(dev, EN751221_CLK_BUS, clk_data, "bus",
> > > +				  rate);
> > > +
> > > +	/* CPU */
> > > +	en751221_try_register_clk(dev, EN751221_CLK_CPU, clk_data, "cpu",
> > > +				  rate * 4);
> > > +
> > > +	/* HPT */
> > > +	switch (hid) {
> > > +	case HIR_EN751221:
> > > +	case HIR_EN751627:
> > > +	case HIR_EN7526C:
> > > +	case HIR_EN7580:
> > > +	case HIR_EN7528:
> > > +		rate = 200000000;
> > > +		break;
> > > +	case HIR_MT7505:
> > > +		rate = 100000000;
> > > +		break;
> > > +	case HIR_MT751020:
> > > +		rate = 800000000 / 3;
> > > +		break;
> > > +	default:
> > > +		rate = 250000000;
> > Should a warning be logged here or in get_hw_id() above? hid can be set
> > to HIR_UNKNOWN here.
> 
> Now that I'm looking at this again, I'm starting to think it might be better
> to just remove it and use a fixed-clock in the DT. I wrote it aiming for
> completeness, but this particular clock has so much code supporting it, I'm
> feeling like it just doesn't make any sense.
> 
> Let me know if you have a feeling on this because I'm swaying in the
> direction of just re-sending with it removed.

That makes sense to me.

Brian


