Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D048628ED
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jul 2019 21:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729009AbfGHTGd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Jul 2019 15:06:33 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36894 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfGHTGd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Jul 2019 15:06:33 -0400
Received: by mail-qt1-f193.google.com with SMTP id y26so6575293qto.4
        for <linux-mips@vger.kernel.org>; Mon, 08 Jul 2019 12:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=VrVrMm/1sGvO1AtHPCpDj09pM9ej99uvdp0h/aIUafY=;
        b=vjpk1DmZpSCtppK1dLplX2MObatzOD4kJ+QzWr4ZpWGTbYQncnW553KcIssWjZ5p0r
         RwP1ilLqMOgtMUAhregkpO8AY91GGqgjFdsWXmTVoK0uztnxe0NtuwI2yjgmVv9an4/O
         mgHexLpRFwgM6z/0ORm18mQF7SDtSxrbmOBpgut1AsRKnmncoSenv1gUbATEnLGanYu+
         EyL8LDMVW2086Tau+SgU0iGw0hzmn6H4ZbjYGftek4UDRBdnrZvbHn/Xqv1gyIC3TuaA
         jgxSTgtmsc8QJEX5gkCFLozYigsyypt/QdasFM5r2FK+6i4Fptctjng77L5zKt2V418q
         ttcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=VrVrMm/1sGvO1AtHPCpDj09pM9ej99uvdp0h/aIUafY=;
        b=RPMbTbDS04o9QkwUVcms17HaYDQo2elGGSZXo7m0y4YwcLmLHCehoORlr4qOZ8wQ3G
         xG28B8wcVnvGTwkQ/DWz60wrKNRR1jpM1GTsnFYaJF76VUjq3TLU2MvopOy63bk5ROXb
         tOKSl+4MyQKQZx+C4l/wcRClDuN7kkydo4IorpJghDT3/+W5Q22P+c5RyTz2+Z7qNEH8
         yGQ2HdyAIVDvBraITZNz7rdu5+vu2O4zlBZXyfL7HiAKCyNUzMdVTCgUu+hQnxcGXae1
         1Z4B6I30HkWJ2DCmTPy9Oo4xeX9d7SXoNas1bHbNQrCKzVxJk1mA6htEdIj52OsnmQPy
         J5Vg==
X-Gm-Message-State: APjAAAV1DcamAJOPK/TBaja46nYYWNeo3iLgvkJfAxmr6z1gXL6N56SP
        hHdUhfIz99J6N5S5N+ZFdzVVBg==
X-Google-Smtp-Source: APXvYqxHKCLgJp3Ha6v+66EanGTOAxhTgf30cjlh1S+XUFymB0hl55sa3QkW3LydHhu0HuXgV/bIwQ==
X-Received: by 2002:aed:222d:: with SMTP id n42mr15455953qtc.144.1562612792246;
        Mon, 08 Jul 2019 12:06:32 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id i62sm5145664qke.52.2019.07.08.12.06.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 12:06:32 -0700 (PDT)
Date:   Mon, 8 Jul 2019 12:06:26 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Antoine Tenart <antoine.tenart@bootlin.com>
Cc:     davem@davemloft.net, richardcochran@gmail.com,
        alexandre.belloni@bootlin.com, UNGLinuxDriver@microchip.com,
        ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        netdev@vger.kernel.org, linux-mips@vger.kernel.org,
        thomas.petazzoni@bootlin.com, allan.nielsen@microchip.com
Subject: Re: [PATCH net-next v2 8/8] net: mscc: PTP Hardware Clock (PHC)
 support
Message-ID: <20190708120626.2cecc86b@cakuba.netronome.com>
In-Reply-To: <20190708084809.GB2932@kwain>
References: <20190705195213.22041-1-antoine.tenart@bootlin.com>
        <20190705195213.22041-9-antoine.tenart@bootlin.com>
        <20190705151038.0581a052@cakuba.netronome.com>
        <20190708084809.GB2932@kwain>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 8 Jul 2019 10:48:09 +0200, Antoine Tenart wrote:
> > > +	/* Commit back the result & save it */
> > > +	memcpy(&ocelot->hwtstamp_config, &cfg, sizeof(cfg));
> > > +	mutex_unlock(&ocelot->ptp_lock);
> > > +
> > > +	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
> > > +}
> > >  
> > > +static int ocelot_get_ts_info(struct net_device *dev,
> > > +			      struct ethtool_ts_info *info)
> > > +{
> > > +	struct ocelot_port *ocelot_port = netdev_priv(dev);
> > > +	struct ocelot *ocelot = ocelot_port->ocelot;
> > > +	int ret;
> > > +
> > > +	if (!ocelot->ptp)
> > > +		return -EOPNOTSUPP;  
> > 
> > Hmm.. why does software timestamping depend on PTP?  
> 
> Because it depends on the "PTP" register bank (and the "PTP" interrupt)
> being described and available. This is why I named the flag 'ptp', but
> it could be named 'timestamp' or 'ts' as well.

Right, but software timestamps are done by calling skb_tx_timestamp(skb)
in the driver, no need for HW support there (software RX timestamp is
handled by the stack).
