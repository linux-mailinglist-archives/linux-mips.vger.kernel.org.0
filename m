Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708A31F4AAE
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 03:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgFJBJa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 21:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgFJBJ3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 21:09:29 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C33C05BD1E;
        Tue,  9 Jun 2020 18:09:29 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t7so293609plr.0;
        Tue, 09 Jun 2020 18:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ABRc9x75FZ1BIH+8DWQ/NFkHc/WUB88yR1a6gg2CyLs=;
        b=mmTD9rkfRI0qQohXNn1UomgZzMfcBH4NSH9zNmaTIVOwfHMkzynAarszqJAxL3SELQ
         TjLkEIhEib8FGJxI3CrP+BeFTWFejV+ckdjyXy1B2Gw+8L3fCtAi95TRVQLF1k3HbHdU
         vWoKvv3aadAqcFkoaP4bNiOAg6bb8tEti8t3z7lfkFfyt2PtZbGL699jEVdbJiOMK4OB
         CMh5XEWJ/8X5ecGC28f32p8HaLdd4o5Lb8YlODC7TDdNTr6sP7lgK+2yJYyuiVeFo6Pw
         8O7Byss01J9U8RfCjtOkUVbVdtbqByOWGR1JBo2+cDZHEkoT1drcwezwnvFG6jTECX5b
         JpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ABRc9x75FZ1BIH+8DWQ/NFkHc/WUB88yR1a6gg2CyLs=;
        b=GyWRhOWKEBdyWXM5V1GKLCsVPzhHppEDZOLZmT9iMkcHalr3HTuO9bQqQ2SYs3sjn9
         wO6MQARZQTCup6EXQs0NMJg7NQ0/Qz5OlWMc3MTVB5SIfdKtJ2iD7R04rwiZ3+r79rJl
         EsLuyQWKaIvRvIZJHCMF1adObDRUY388yaMGRUZadjMJ0cdfv23YkJ2IGPWrUfIJa8PX
         c7a7dzc+YaToqPNXQHHNVjPRoC0jLxbClqXwqMkX5ru8Utqp60LkWRQsF0sBycSEqzV0
         VwaI7c15o9Qdc1PpZqedzJ1+xI5dMm2fNhHdg8xZnstrmzInr2TmgOaP9//UPMW//KtN
         50cQ==
X-Gm-Message-State: AOAM531KvMIiEQifOJf522E4UQnAdd9aYhRMIKzxVDQJkduRT9cg0vaF
        6XRTzG88u4W5qAM6cUHo4i0=
X-Google-Smtp-Source: ABdhPJx0i+2iwgV0TcfhSI/1mUSHemc5vHExVs8W44ZJcUZNufh53Dp8a/w6K3Sj64qNdXQabx736g==
X-Received: by 2002:a17:90a:1ac3:: with SMTP id p61mr544857pjp.23.1591751369439;
        Tue, 09 Jun 2020 18:09:29 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id i22sm11014554pfo.92.2020.06.09.18.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 18:09:28 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] mips: bmips: dts: add BCM6368 reset controller
 support
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609160244.4139366-1-noltari@gmail.com>
 <20200609160244.4139366-8-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <49868b7e-ca14-1e39-50c1-c2de3c633200@gmail.com>
Date:   Tue, 9 Jun 2020 18:09:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609160244.4139366-8-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/9/2020 9:02 AM, Álvaro Fernández Rojas wrote:
> BCM6368 SoCs have a reset controller for certain components.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
