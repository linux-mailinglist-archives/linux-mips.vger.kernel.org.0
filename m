Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2342039680F
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 20:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbhEaSq6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 14:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbhEaSqo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 May 2021 14:46:44 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2058C061760;
        Mon, 31 May 2021 11:44:57 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id o8so16159924ljp.0;
        Mon, 31 May 2021 11:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=79vD5fPBpuqJk8BjQVZSQr4mk68U0V00Pi0IrfP1E+M=;
        b=ixQHV7O1Jnid0/lAhrc6f8PJ7yXOT3iZeSwgte5o+5eGGjBWik4JLPgjXKgQqbI/4n
         AzcbI3Xn0bBqNWcRRZZ3Ejy7opZhfIva3huN4AcImLORMW7r0annLMjRcYdH1Fz1z/uV
         7VeN+6GDRjSvTUSgVomxmD5GeLQ8Oc0fOEVwh5RDCKyXhyJTY8d6BnmyyzgESlc1nOxT
         YsAZ0CfgHfN7mBpqbvQDzxFE45TNOW1hhIcbx3WYdkQN795zoe4FAiqZQvla2PkrARvA
         ADkUFG6M722rPlnqXpZq089sOC0+qhLUZvS12KHL0NFlXBlZLEyAIDKa30T3Qwv5+BYK
         GzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=79vD5fPBpuqJk8BjQVZSQr4mk68U0V00Pi0IrfP1E+M=;
        b=GsG8EiOmvWJjk6zpPSXW37kjGr7aGPn+e+vf0HVG5kYwJ2Q3Sf/kbJUIXJIYbXioZS
         N2zcl5+R3LMYFC+o4LRFn64IbdRUhTmdqZ8uZT7yqiI/8gMZrl8JG0Drs7V2WDZE/sQG
         0EFYA/a9Dz6FVzbRXM9k8CjI/LXhfJzYAttObst2b6Eh7/ZCNLaZmpoadbS328xrMLgZ
         bPe7PJpvpcBpPmR7t6/sViuecaPkGBhMVtPoPriIYll/hK/cQymkwgz6e2SgKGmfqYjL
         A9zcQR9MbgLiG7P0G0HyGeKG+f6mYrahfeB7s93tO2V+PXfGyZjSL4j6YT3yp8l3n7Sq
         5XZw==
X-Gm-Message-State: AOAM5305+ATG90qrnG6ZUOh2CgvKzH/w/P4I+89/s4ud/EBhT5/UoZ7w
        EWWLwBWEogf3Vquxs06aj+knqZf2hHY=
X-Google-Smtp-Source: ABdhPJzwHa2O3tQI6SdJ2nYRIHhOGUD4JpkZi3hQlX9rJYnZ5sdfcrEYOKXStv1Grwdln5npijZ3JA==
X-Received: by 2002:a2e:9c8e:: with SMTP id x14mr3613896lji.264.1622486696164;
        Mon, 31 May 2021 11:44:56 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id o2sm1631880ljp.60.2021.05.31.11.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 11:44:55 -0700 (PDT)
Subject: Re: [PATCH 0/7] clk: clean up legacy clock interfaces
To:     Arnd Bergmann <arnd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org
References: <20210531173429.2467403-1-arnd@kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c4161b44-1628-9b75-083d-2715fa366596@gmail.com>
Date:   Mon, 31 May 2021 21:44:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210531173429.2467403-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

31.05.2021 20:34, Arnd Bergmann пишет:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A recent discussion about legacy clk interface users revealed
> that there are only two platforms remaining that provide their own
> clk_get()/clk_put() implementations, MIPS ar7 and and m68k coldfire.
> 
> I managed to rework both of these to just use the normal clkdev code,
> and fold CONFIG_CLKDEV_LOOKUP into CONFIG_HAVE_CLK as it is now shared
> among all users.
> 
> As I noticed that the ar7 clock implementation and the ralink version
> are rather trivial, I ended up converting those to use the common-clk
> interfaces as well, though this is unrelated to the other changes.
> 
>      Arnd
> 
> Link: https://lore.kernel.org/lkml/CAK8P3a2XsrfUJQQAfnGknh8HiA-D9L_wmEoAgXU89KqagE31NQ@mail.gmail.com/

Awesome, thank you very much!

I see only this cover-letter email, will we see the rest of the patches?
The patches 1-7 have only linux-clk@vger.kernel.org in the recipients.
