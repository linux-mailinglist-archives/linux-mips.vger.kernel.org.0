Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07242B2FA2
	for <lists+linux-mips@lfdr.de>; Sat, 14 Nov 2020 19:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbgKNSZg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Nov 2020 13:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgKNSZg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Nov 2020 13:25:36 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D50C0613D1;
        Sat, 14 Nov 2020 10:25:35 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id l11so6840737lfg.0;
        Sat, 14 Nov 2020 10:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sADNNqeti4uK70pBgtaD+SgpD+B/8/G1XqY/+iUb/i4=;
        b=O2tVMQNEzKXzJWXZAXT+FGuFehNg51hOosvO+53wXJhcBEeVQrtUZvyNVytrtDHxtU
         PGNtKRQMb83d5kZMD9HAqChcILKXF6hQOzjLBilHPYYvSZs3v9hSBgOoqOGrMA9Bz+DH
         idrOcv8kzIRPJsdt6OiHoxeBGOs83AvUqvnOv/VoHp2gTClDT65phe4dqNT2tX/9FWxR
         X/+bNW4Ma1exbtrO86xszL1lbrt7R0FT567PIzZJv7QhxKTAY96Pnfio7cLaKcnVe5Lm
         cMUV/fXjzdDgPsHndWsKGQzdA+BiYsr2+Y/F45YeWIUy1/UOXMvZ5XLz4ZSPPaFEfTH+
         ieEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sADNNqeti4uK70pBgtaD+SgpD+B/8/G1XqY/+iUb/i4=;
        b=K9JDdrwgIm/ilmJ4bdBvlIDO56cWjLna2w300lMiPREQJMvFqSv+kV+F8BzWEold72
         u6bbLGOXpdBcvdrXjW11zjbHRUyXWdd3dJh7kbsSHrGajFQKyOKEVya8axvV3eZWFc0m
         e9/yPXO0rveeuTYpey4dQ8E5fKFRUjRLdUF5MnzsZ8tW4D6y8wOpsDd76KAHB/UcrTmJ
         69UHdt9V5gpefDfnT29erAAowKBXX7C8gpazYwVjsvXC34NkCow0nuUk9UiQ6QY8+p/k
         S9Wz33FkV6l731/078WkmvqodLhzJkM0B9UlcCoQNaGr13cHpF0hnq6ey7iH++3DNAi4
         uLgg==
X-Gm-Message-State: AOAM5336Vd+uYNxDR5hJXihKsC3rUugg1S5cuzye6vjtJsj13FP9O5wK
        Bu2A3IJLAYxjrLDPZASjp8lONVfkZTo=
X-Google-Smtp-Source: ABdhPJyFs9HMe9D0ZqCz/JRLRfBiaU3NkKPYI05KLudJRj5vp8HcGkSozS69wEs7YfHwtTF4F5Vr+g==
X-Received: by 2002:a19:915c:: with SMTP id y28mr2691321lfj.173.1605378333668;
        Sat, 14 Nov 2020 10:25:33 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:486f:632f:b75d:4f91:4b03:d7f3? ([2a00:1fa0:486f:632f:b75d:4f91:4b03:d7f3])
        by smtp.gmail.com with ESMTPSA id t6sm1714695lfe.81.2020.11.14.10.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2020 10:25:33 -0800 (PST)
Subject: Re: [PATCH 2/2] MAINTAINERS: Set myself as Goldfish RTC maintainer
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     Miodrag Dinic <Miodrag.Dinic@syrmia.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20201114130921.651882-1-jiaxun.yang@flygoat.com>
 <20201114130921.651882-3-jiaxun.yang@flygoat.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <6bcbba2a-5a75-9b07-1816-edf6fb77a664@gmail.com>
Date:   Sat, 14 Nov 2020 21:25:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201114130921.651882-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 11/14/20 4:09 PM, Jiaxun Yang wrote:

> While Gildfish platform is dusted, the RTC driver remains

   Goldfish. :-)

> valuable for us.
> 
> I'm volunteering to maintain goldfish RTC driver onward.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Miodrag Dinic <Miodrag.Dinic@syrmia.com>
[...]

MBR, Sergei
