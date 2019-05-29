Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F039A2E807
	for <lists+linux-mips@lfdr.de>; Thu, 30 May 2019 00:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfE2WSt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 May 2019 18:18:49 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]:40083 "EHLO
        mail-qt1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfE2WSt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 May 2019 18:18:49 -0400
Received: by mail-qt1-f170.google.com with SMTP id a15so2513136qtn.7
        for <linux-mips@vger.kernel.org>; Wed, 29 May 2019 15:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=Wc/2ZTn3bTmajEUQNWRtv6uulelmq6BsGRobTvdNAko=;
        b=SksXRdsB8O7xv2f88XfT5zyPQ0rks09KzTEHjOnbw/ryUGuywHy5C96zm7m55V4q1S
         6pOsPtw7TOD4SVxUkZVF6hQVs99zRYAPUXoTYJjTjUlXY9L9EvD9Cu3uYN3qX+rlsoQx
         WWgrHNM4W/Dqq8MGzbR7W8JMqj5bR8alEOxERhiCFvJGCcSL4H4Jc5HW66kKpESk8wmh
         6KVbUPIhHzmYlipsNDxxyrG8BX5og+rz5KIOWdRFvXWw618m0zTP4qATl5bw61Z6KRvf
         ey9UjpJwQOjMA7VP5vq5C7zNgR67G428HtZ2cSushTk7wJyPG4qSakQr9c1C8A6E0ppa
         mVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=Wc/2ZTn3bTmajEUQNWRtv6uulelmq6BsGRobTvdNAko=;
        b=URZzf/soXqN3APfxMh7fW5K726idcIsxR1qL05seRkYXzg3ps1UQ62lAvy4Pu2Ik5C
         vk1+ZOSbkQVpcKGiGbFTFv3egzOgpperlca90sIypmLJAGFRlZf2ygTSIANpSpt97TCM
         HT9MKbf2iMSfqcqwYm9tcxDB2jxbfjyiuNOciU+1BFFkfJPXmXV2ab5PaT7y+WJyAWCo
         AWaubx5l665l+h4B4cuOoxJw/352x6jxnmf92QMDZwwHRc2t8EMbyAbB6akhukaDTsUo
         ry88WIEHxfyEXfnb6e9C+HtCs7+2qrBSClNgdL64exxDJwYtsx00nwUJGxZanmiAX0hg
         QFqQ==
X-Gm-Message-State: APjAAAVK6AruLbv4lHeOW5vV2/LXMruhfV07YhxqVwZgxgkcs7stJrJK
        xkOUSf9p5zf+jlfBPmWSkv5V0g==
X-Google-Smtp-Source: APXvYqyrWklChrPKL+Kd4yWTw1qaxtz9fRC45MEyUccJVW59QWt96Dd3OtsUvwdgNreRsyBaN2yHeg==
X-Received: by 2002:aed:39e5:: with SMTP id m92mr394942qte.106.1559168328672;
        Wed, 29 May 2019 15:18:48 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id s28sm400345qtc.81.2019.05.29.15.18.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 29 May 2019 15:18:48 -0700 (PDT)
Date:   Wed, 29 May 2019 15:18:44 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Paul Burton" <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next v2 2/2] net: mscc: ocelot: Hardware ofload for
 tc flower filter
Message-ID: <20190529151802.19aa82a2@cakuba.netronome.com>
In-Reply-To: <1559125580-6375-3-git-send-email-horatiu.vultur@microchip.com>
References: <1559125580-6375-1-git-send-email-horatiu.vultur@microchip.com>
 <1559125580-6375-3-git-send-email-horatiu.vultur@microchip.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 29 May 2019 12:26:20 +0200, Horatiu Vultur wrote:
> +static int ocelot_flower_replace(struct tc_cls_flower_offload *f,
> +				 struct ocelot_port_block *port_block)
> +{
> +	struct ocelot_ace_rule *rule;
> +	int ret;
> +
> +	if (port_block->port->tc.block_shared)
> +		return -EOPNOTSUPP;

FWIW since you only support TRAP and DROP actions here (AFAICT) you
should actually be okay with shared blocks.  The problems with shared
blocks start when the action is stateful (like act_police), because we
can't share that state between devices.  But for most actions which just
maintain statistics, it's fine to allow shared blocks.  HTH
