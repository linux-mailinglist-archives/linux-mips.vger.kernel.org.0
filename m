Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1FF622C248
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jul 2020 11:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgGXJbP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jul 2020 05:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbgGXJbP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jul 2020 05:31:15 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A86C0619D3;
        Fri, 24 Jul 2020 02:31:15 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h22so9295302lji.9;
        Fri, 24 Jul 2020 02:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TBUxgudIuaDLAvLBANWhcm32RAOD50DQBXyfj2jsnh4=;
        b=Mf6ETM7ztIRbwjiqdscapi6l9//E/tfVMAaamIup0eE1/HQOKAdQHP6t1dPv9Y9wQh
         QCq3ECza5RUGvdRueuVmu5PemT0/eJsrc1xZTolBXPT9d8p5FNOREcaVe9nNJsD4/XOn
         fbO58i7FBj74xB8EhCAVW37Njy/qdCvnvx3zj88P2Qr/f0yaBQtVXQssU4xQG7UKrTj9
         AeaJ7r09bRqFXHURxpbKEYu7C+aA+gd+LZ5TyulVZasfOuwC5jUhmYZpCOaGU2cpAFhQ
         SWdrI1DmMJEltKZaQA6fucFMfH8SAnju0B5/+mJHw5p46opV3I0Gj2xToLOuShtW9IPV
         8xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=TBUxgudIuaDLAvLBANWhcm32RAOD50DQBXyfj2jsnh4=;
        b=TZ7v+rnHi//XdLAuet4tQtKbAuPHE9lrpKn00fHLkVK2mcF4TIn8MSjRIGRUDX0WBC
         oZ8Z7WDJR6vWbz5ZBliGnMoV9k+FIdmVnK1BqJYvTiSg2okcfViG8HFhnW8BG5cqjKG0
         PR3++h3kI6jA2h2Vmg/rTq6SIWJo1pqzKChG8P/Q9IpoVsuntreB8qoEIE/IeXVIUPu4
         hBteyE5FOZx30uBW9D3rfXbCvhOGGLEpzV018xkWjDPuPGqg4/a8/T3zZZtlHSYeozkA
         wkD7Jubm99vYcC9pjr7ut7rPH3H5eZO28JO/YsFUyfWte7uAb/R/DL9G3VVKE9VFobex
         KOuA==
X-Gm-Message-State: AOAM532OB/c6czXq4cxNbnBeTL7woNVXQyoNcnWaQdXXUrH/q6A0NcIn
        d+IVv87QBiNngVM98I8S8vzODMoYXlI=
X-Google-Smtp-Source: ABdhPJyYL/2FJHBDk6bM7QU+nPX0YDimDInJXXxpicOfu+ldA96NXGc/cdDQ7seaU002+wFwwJXGJw==
X-Received: by 2002:a05:651c:156:: with SMTP id c22mr4151018ljd.453.1595583073494;
        Fri, 24 Jul 2020 02:31:13 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:48a4:44fe:25f3:4dcc:b496:1546? ([2a00:1fa0:48a4:44fe:25f3:4dcc:b496:1546])
        by smtp.gmail.com with ESMTPSA id n3sm120108ljj.39.2020.07.24.02.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 02:31:12 -0700 (PDT)
Subject: Re: [PATCH] newport_con: vc_color is now in state
To:     Jiri Slaby <jslaby@suse.cz>, gregkh@linuxfoundation.org
Cc:     linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <202007241318.wXYkumEO%lkp@intel.com>
 <20200724062735.18229-1-jslaby@suse.cz>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <b1b9d90a-5fe3-947a-dc4e-8576cd143869@gmail.com>
Date:   Fri, 24 Jul 2020 12:30:59 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724062735.18229-1-jslaby@suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 24.07.2020 9:27, Jiri Slaby wrote:

> Since commit 28bc24fc46f9 (vc: separate state), vc->vc_color is known as

    Cgit says "Bad object id: 28bc24fc46f9" (in Linus' repo). Also, you should
enclose the commit summary in (""), not just ()...

> vc->state.color. Somehow both me and 0-day bot missed this driver during
> the conversion.
> 
> So fix the driver now.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
[...]

MBR, Sergei
