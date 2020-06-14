Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88CA81F8713
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 06:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgFNEvC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 00:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbgFNEvC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 00:51:02 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7875C03E96F;
        Sat, 13 Jun 2020 21:51:01 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id h22so2244127pjf.1;
        Sat, 13 Jun 2020 21:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=+UAjwI5a8kxCzSTc5QwwLfMSpQ+UrabjdUS6QusacR0=;
        b=gbD/kUoWzsRtybezmSy9KLARGsvFFgVj5Upmj2adfFbXTeMb3y0UpMzqp2axicod8/
         7h0PUJdJe6W5ijuAdavef7Vgj+0ekjIkC4OvJ9jaNjtcI+jgDhI2cpUH+AzGnfNNeuIt
         /Bda2UR/hDqj2vo/Hc7/Bk/ERbKidfPGL2cgUDdMWiX2ApZawTO0S2fIscEFD7D1QcgF
         MA7HGcDfeyGl6S8AZU+5l9aKpQR0V66zFDu2QzwOX+0WOytRRNr5S7nDKijtEMT0fnlt
         0NMkFpwb/8mRye7np+NiuaxUQQl5rsMI6jL6+mF0AtdeV2C+9DPOsPSNIEUb6Jgsopkh
         hVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+UAjwI5a8kxCzSTc5QwwLfMSpQ+UrabjdUS6QusacR0=;
        b=MWmlZZ9qVPUhlKR+f9OgGy5qK6Fcv/i6o9wfv4tb8QJUgaEQGEB+7COTRxP+qhVQVF
         FNlGfrYITpQ+8DawrN9vjRXQpd6rz0eNKNDhHT7nR3xzzQ9A4L1Y3B8HsuKOZjGsI8rc
         Yrp/+VhJAN73/vr+kLdpmASSFnqBePfU1XvRsJGRfl3imSehiv8deB3eTFoYCKqtwtRn
         0GxkQldcMPqiZtPGoMT+LoMwkVTttZx/tkofipRxB2Xvwdly6NK9lbPY+Ou2bBJfbx5E
         aEmiCzDeZhu/8u20GKcptKZOKWZzp5Gl8jaoDh/uthhV2kFwo/2PaNmc35YqWcBIzVUq
         YM8Q==
X-Gm-Message-State: AOAM530+VQDvKcN0iJDgi5g/4pma2Xz1X6qzTq4s/J6yPzOGC/6bnYBq
        6QDX6zCEEaRZhMht+LTMr5g=
X-Google-Smtp-Source: ABdhPJyJGVByv5Uqfo9DXsZV1plxxruC+A7lfDktYLjxS5WyhSDz9hAYqr4RM/FGDjV+I4HUthqVgg==
X-Received: by 2002:a17:902:724a:: with SMTP id c10mr17239525pll.306.1592110261471;
        Sat, 13 Jun 2020 21:51:01 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id x17sm8943836pjr.29.2020.06.13.21.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 21:51:00 -0700 (PDT)
Subject: Re: [PATCH v4 8/9] mips: bmips: dts: add BCM63268 reset controller
 support
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com
References: <20200610172859.466334-1-noltari@gmail.com>
 <20200613083813.2027186-1-noltari@gmail.com>
 <20200613083813.2027186-9-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <882e5715-176c-2d3b-fa4a-4f452130a628@gmail.com>
Date:   Sat, 13 Jun 2020 21:50:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200613083813.2027186-9-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/13/2020 1:38 AM, Álvaro Fernández Rojas wrote:
> BCM63268 SoCs have a reset controller for certain components.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
