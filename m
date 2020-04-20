Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7671A1B1784
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 22:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgDTUty (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 16:49:54 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40139 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgDTUty (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Apr 2020 16:49:54 -0400
Received: by mail-ot1-f66.google.com with SMTP id i27so9374743ota.7;
        Mon, 20 Apr 2020 13:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kAcKMy1aYaS0n+X31X2lK3NhfAMy38AnEV4isTMdyRw=;
        b=fwpyW4YyOhyepLKSoVGUPy2sAPL8aO498XAyAdzUAhJkzERTxkJDevLsMW6SxjfoyT
         +TdyEQXURqWEnpovw8ffxqmdyGhQBL9hiXuu5VRmZ0cBlm8gan+Seh6B7XA9oFcTSt/1
         lzJ8t6MLppcOADO/c+E9Oj9+hwMdaj1DU2GaeY7gvBq2WFUPt01YfQF+dzUR/+sKoUeA
         ISD/Lr5QonH9pYTP+bfMp7x0dLhrV4n7OV8Pj0S5Zr6iMoDLQlb5wg2xXlXRzo5Ps9bH
         YnjZhoijg7xljPWAlIEZMtzN9wZe1sXjwH+BNlAXoTdppEgC0Znbob0LC3FxTtL6tQul
         UEKw==
X-Gm-Message-State: AGi0PuYHRSTB8t7qTQNtl3nnxfihCpuWaQS9Cl4B5T2YdxcTSgkh6kSB
        ecArRsQjB8gHEFA/HjdR2Q==
X-Google-Smtp-Source: APiQypJMei44kGC8DN4xjPTuMNH0j3kVdUg08HmyMOwiZwr3n7oeuXooaAI7Nr16tehVB+Z85Zu13g==
X-Received: by 2002:a9d:58c:: with SMTP id 12mr11389928otd.156.1587415792353;
        Mon, 20 Apr 2020 13:49:52 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l11sm140387oom.15.2020.04.20.13.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 13:49:51 -0700 (PDT)
Received: (nullmailer pid 5742 invoked by uid 1000);
        Mon, 20 Apr 2020 20:49:50 -0000
Date:   Mon, 20 Apr 2020 15:49:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>, od@zcrc.me,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/13] dt-bindings: usb: ingenic,musb: Add
 usb-role-switch property
Message-ID: <20200420204950.GA5691@bogus>
References: <20200413152633.198301-1-paul@crapouillou.net>
 <20200413152633.198301-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413152633.198301-4-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 13 Apr 2020 17:26:24 +0200, Paul Cercueil wrote:
> Add the common usb-role-switch boolean property to the list of the
> supported properties.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Documentation/devicetree/bindings/usb/ingenic,musb.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks.

Rob
