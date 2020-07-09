Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1595B21AB1E
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 01:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgGIXAp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 19:00:45 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:34132 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgGIXAp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 19:00:45 -0400
Received: by mail-il1-f195.google.com with SMTP id t4so3503886iln.1;
        Thu, 09 Jul 2020 16:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=MtB7J5NbFVzODA5r23GZJOZvqWcvN6kX66b6U57wwzo=;
        b=IkGXwKVIDC5DrCiyvfxWZXEExJ9T2wCqezlU4t/38ZtnPvHiYhYk3NIj4GJZ/GNthS
         86ZMK7amewnYWp+W1jWdireQq4dCm1T1LzedzIkXtD6RVAVdhNN6RiA2Cs5PRMHpHEZ2
         A+1aDs9AdWRTfaD58lo7z9u/yquQBeKhIHqmA8j1lUtzg8BJEVSPLuSiVNz6etTSkI4D
         wlySS/yhJymaI0J8oF/YsUFsRxxjDOB6kQbM8j6YlDbOh2TrFCUM+v1cGjnvwjRY4tqv
         amgvpwxc4PMkwQkh7xHeS6qF2iXpAZAysLrfLyEIHQqMQyfeLH0xJGDGTBemarlWTtYn
         0sVQ==
X-Gm-Message-State: AOAM533CbNzxNrdbGeAIOrtu7BI9aiNPvTzOlnuSAVlJ5BOnng0ML+yI
        eoFQuAwvSrpXZo91iZn6qQ==
X-Google-Smtp-Source: ABdhPJwL1TS1R3rxNHfGQnDWQ6ldcEtrnDDG2h1hsAeydYos4lD/JFRGwYuot0sfEw9DkNsOE90R9Q==
X-Received: by 2002:a92:502:: with SMTP id q2mr46375703ile.61.1594335644048;
        Thu, 09 Jul 2020 16:00:44 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id u15sm2825963iog.18.2020.07.09.16.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 16:00:43 -0700 (PDT)
Received: (nullmailer pid 1052260 invoked by uid 1000);
        Thu, 09 Jul 2020 23:00:42 -0000
Date:   Thu, 9 Jul 2020 17:00:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     f.fainelli@gmail.com, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        hauke@hauke-m.de, zajec5@gmail.com, jonas.gorski@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/9] mips: bmips: add BCM6362 power domain definitions
Message-ID: <20200709230042.GA1052174@bogus>
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
 <20200613082140.2009461-4-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200613082140.2009461-4-noltari@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 13 Jun 2020 10:21:34 +0200, Álvaro Fernández Rojas wrote:
> BCM6362 SoCs have a power domain controller to enable/disable certain
> components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v4: Remove "dts: " from commit title.
>  v3: Separate dt-bindings definitions from power domain .dtsi support.
> 
>  include/dt-bindings/soc/bcm6362-pm.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 include/dt-bindings/soc/bcm6362-pm.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
