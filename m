Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684673402F2
	for <lists+linux-mips@lfdr.de>; Thu, 18 Mar 2021 11:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhCRKMZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Mar 2021 06:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbhCRKMT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Mar 2021 06:12:19 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACFFC06174A;
        Thu, 18 Mar 2021 03:12:19 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x28so3649969lfu.6;
        Thu, 18 Mar 2021 03:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fj+8CF0xEa6bOzXqxjtIYrEA5HoToR1DJW5/Q9q9jmw=;
        b=h+XOb1GsQ2w8fLoRZPzFbHuKl4PLZbrg1n3NNXlB+1pwKaDpv3IYeBwNMYTnaAe/dv
         53qY2HQRgJloO7YPpYoaazxwB0LyW9cda/3XqephYo6XWuKffw2EvNS/BeW8bu2CjhLn
         YWTP2x1H0eEBDgDtwckTaScppt8aK7lt+V3njf7QJpXzuiT7grarbWs5GRfMMbxHi5hx
         sbbCxsAJNuzngqg7yz9ZWUT+6eIJtzHyMp4aZtClTbLq39j781dflkTtZN7C5T1u2Nwq
         xymOipVtMZt0XepUbRaIZljM2iUOt+cNzBqUcJW9l5gvLHs6joBPpTbT1tLMNxHlVuyX
         KLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fj+8CF0xEa6bOzXqxjtIYrEA5HoToR1DJW5/Q9q9jmw=;
        b=HUCNz4GlwqZgU+TK0qPxyR4jdJJ+lHsiaAAyJQHSS5CSDIl7cge4W1n1bU3z5RFA3N
         qlZvbj9UwUIbBFpidDUW1bom21so2OhGcLlUZIPAj+mq+MtLIUScm7pJqEDPr+e3m+sE
         Gr//733uEoLYmFsaI5aqk97kyi5S0gS2qyzjvYByiWzCdT1xvAqjKHGc8jw4DJ+ti7LQ
         S5P/GKoG9PfsSHFO8b8hwahTNIv+1VGpMN6EdNTTV+/m8es+ytg/dO6VXCKRX1NOVqJ3
         QfJ9ZGMaKAovEJgLRojC3cpZa0k090THsDN9c+jR7e2vovZt1905VoJ3ufvW7fLhVu3y
         Z0bw==
X-Gm-Message-State: AOAM531xYL+TkUY0pLfwmCgC570IvuKETDFyriUveloCSWrKHdsljRbS
        a7QCvdwbo5sRmbVzFlX1Gqk=
X-Google-Smtp-Source: ABdhPJw0WKNmAy7eGUCvhofce6ngmswkk73bpXDn/HaCVJQto32NE95sJGLkJZuXS7ucQeT6WnUpaw==
X-Received: by 2002:a05:6512:238c:: with SMTP id c12mr69712lfv.200.1616062337968;
        Thu, 18 Mar 2021 03:12:17 -0700 (PDT)
Received: from [192.168.1.101] ([178.176.78.3])
        by smtp.gmail.com with ESMTPSA id p22sm168167lfh.113.2021.03.18.03.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 03:12:17 -0700 (PDT)
Subject: Re: [PATCH 08/10] MIPS: disable CONFIG_IDE in malta*_defconfig
To:     Christoph Hellwig <hch@lst.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jens Axboe <axboe@kernel.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-ide@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-9-hch@lst.de>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <5b0f503e-a27c-a241-c705-b2a9ccd6d0a2@gmail.com>
Date:   Thu, 18 Mar 2021 13:12:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318045706.200458-9-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/18/21 7:57 AM, Christoph Hellwig wrote:

> Various malta defconfigs enable CONFIG_IDE for the tc86c001 ide driver,
> hich is a Toshiba plug in card that does not make much sense to use on
  ^ which is for

> bigsur platforms.  For all other ATA cards libata support is already
  ^ Malta.

> enabled.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
