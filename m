Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98F8BD37AE
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2019 05:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfJKDAX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Oct 2019 23:00:23 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41751 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbfJKDAV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Oct 2019 23:00:21 -0400
Received: by mail-pg1-f196.google.com with SMTP id t3so4902985pga.8
        for <linux-mips@vger.kernel.org>; Thu, 10 Oct 2019 20:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=nP3GB4eev/Uw/7TzzPBf7q6vVOFurBjXFqfQUZ+MDGI=;
        b=KzBWLKoFEXWJXPLXk8rihO70idubrVY0AvebVOxegnFY86QJmJGnQAku+lqeexuYjB
         9G74EjZ5ZvlXtWdwx6WwfpqvWL6VZhkBTLucMGD8v4+2hORNhyJnUiBwwpBCF8JxvYyl
         Y/VEUCQaO4qMcQjX25jnBmyNowejWuBTvCczZAtLpuYiP3fyFPOQUIuwfkc7KI12BXX2
         EwM6/7cZLGE5aW9q4v+KkZG7M4Ko8VEfRigsYkPSfXxu8CCT86YN8Kz/jywZSNG+JnPs
         /EYL79jv7SvwRhbBYvBe5MtI4NC0fHqrZX5X0RP9DTqt0mKF84SdidfQjH90hJrCfHuU
         JAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=nP3GB4eev/Uw/7TzzPBf7q6vVOFurBjXFqfQUZ+MDGI=;
        b=dMmWBWXjw6/pZggKO/EW+88yFnsiov9jGX9x5Jn79SBUM4JX3Y2vzsz+BLZXHfo02L
         PB6ty3fe0qxaGmdJdTL4UQQwgN8UDBpV0cFH6pLNQsDqWuI8lHsrkH2p2oPCfvtyjGES
         7ETc9/gjphJ/sPiSg4Ek3XWieZW9pYluLLE9EAPRAGs5x3cRQfQA8cSNFDuKoPzbIACi
         Nh442/CzrXNeTI/8qtNqHLZVgrfTSDNXfYdVD/whtz2DkgjCncwxGpMB9UAPaw/SF0n7
         HMauM4Oj1tHdyfL5JyD30l+e4Lhybhd0maGgVvrV6dsX2VT+fLXmA58Da/UUG2BzbKjP
         igyw==
X-Gm-Message-State: APjAAAXTrM40rSvY1iMuajlRYhFlYcctWzHwkJDRdhoAUHH8bm/HIp2R
        u3Ito/whHQbUMfFy80jkPjSBuw==
X-Google-Smtp-Source: APXvYqyC7PSkR8RT7VypdyqNldAyGXeW91322WLbhsrNNwrkgAMBn6eiIibb+JzCUjR+ko/vo+L6ow==
X-Received: by 2002:a65:688a:: with SMTP id e10mr13223631pgt.122.1570762818461;
        Thu, 10 Oct 2019 20:00:18 -0700 (PDT)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id q6sm8505284pgn.44.2019.10.10.20.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 20:00:18 -0700 (PDT)
Date:   Thu, 10 Oct 2019 20:00:02 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v9 3/5] mfd: ioc3: Add driver for SGI IOC3 chip
Message-ID: <20191010200002.5fe5f34f@cakuba.netronome.com>
In-Reply-To: <20191010145953.21327-4-tbogendoerfer@suse.de>
References: <20191010145953.21327-1-tbogendoerfer@suse.de>
        <20191010145953.21327-4-tbogendoerfer@suse.de>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 10 Oct 2019 16:59:49 +0200, Thomas Bogendoerfer wrote:
>  	dev = alloc_etherdev(sizeof(struct ioc3_private));
> -	if (!dev) {
> -		err = -ENOMEM;
> -		goto out_disable;
> -	}
> -
> -	if (pci_using_dac)
> -		dev->features |= NETIF_F_HIGHDMA;

Looks like the NETIF_F_HIGHDMA feature will not longer be set, is that
okay?

> -	err = pci_request_regions(pdev, "ioc3");
> -	if (err)
> -		goto out_free;
> +	if (!dev)
> +		return -ENOMEM;
>  
>  	SET_NETDEV_DEV(dev, &pdev->dev);
>  
>  	ip = netdev_priv(dev);
> -	ip->dev = dev;
> -	ip->dma_dev = &pdev->dev;
> -
> -	dev->irq = pdev->irq;
> +	ip->dma_dev = pdev->dev.parent;
> +	ip->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (!ip->regs) {
> +		err = -ENOMEM;
> +		goto out_free;
> +	}

