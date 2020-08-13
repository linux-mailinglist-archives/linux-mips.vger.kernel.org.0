Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2B0243DCA
	for <lists+linux-mips@lfdr.de>; Thu, 13 Aug 2020 18:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgHMQ65 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 12:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMQ65 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 12:58:57 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE07C061757;
        Thu, 13 Aug 2020 09:58:57 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id c10so4482530pjn.1;
        Thu, 13 Aug 2020 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=olkCz3qauGZtAoAm2mefdOOlM1vSB0djGLpawNROqyk=;
        b=bfsD1bHKjHgagcIbmGw6JdjOw/zGzVgK+pVIsM9i5IMwG1dS+sE4l0aNRUTdNNUIJO
         Jin3/PhfpJRRFFddzUs4iuL/5QBvhFoaX4WHc/C+f29H5NnM9a/HUM7WXvCy/V3+ZhSv
         8NYES4sCehyKzwORLKjA9tRNZQyW74+eDABy9UFzV3ZQ/EoiQIYnL0vwK5TbqySWNkMA
         oU49qAxoJEASJwfKivEgohiVCOsId3cosJ5qS7yTh0jnJG6A5edpt8GYs9hfoJW6GmrV
         Dljk4nozIVNsoI7z0BCPDvTtHlAmXU/REXI4fT3LCcMYyKl0gIOjL82SMUAUOeqWmJE3
         p+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=olkCz3qauGZtAoAm2mefdOOlM1vSB0djGLpawNROqyk=;
        b=ewkTi/A1md7icWd+pv7WAyQA6pVDknei5HfZtnrdnkv1rQdmCwMI9TF6ATDmidRcuv
         P4jS+UnQ73JsR9lkNzQm9pP7UJwoqmbr802tVcdXaRil5uh5o3curdeZN5phfBk+afPZ
         uPkVrtYAvSa8/RPY/Od43D09DCO154QxkZTJK4wuMqlGB6BzvxbiTgLFFSNVFWrW5MBr
         tKBl5E1rqUizWwJXnBJVxKzE0HSnLgd7YUs++74JaY4Z399stpj9hoA/VJF/Fh6gYH9d
         b1W1DGVNQ5ZAYpKWsQ7xvw7aBKKUStu6aJ878D2rU2DxHtZR9RTOzzJo+Cj/p/sbXiOD
         0zrg==
X-Gm-Message-State: AOAM530coftTswVRFB3rU7RFwcCGev83m2CdOVhxujz8p+ng8vtmnKGH
        zT7uRJtNAMsTCl2DzEDYZ6UXvr2p
X-Google-Smtp-Source: ABdhPJxuRb1zZlRnM6RiqZndkFPGk5rps6oWW8G4wPOAxDvKdb8ZUbEU5ZuLHsLEVTvWxtPiujctgw==
X-Received: by 2002:a17:90b:1116:: with SMTP id gi22mr6237958pjb.209.1597337936137;
        Thu, 13 Aug 2020 09:58:56 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 75sm6454278pfx.187.2020.08.13.09.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 09:58:55 -0700 (PDT)
Subject: Re: [PATCH 09/14] mips: bmips: bcm3368: include and use dt-bindings
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        robh+dt@kernel.org, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200812063129.361862-1-noltari@gmail.com>
 <20200812063129.361862-10-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <493ccb41-71c7-2c1e-7ea0-3b4639192c45@gmail.com>
Date:   Thu, 13 Aug 2020 09:58:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200812063129.361862-10-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/11/2020 11:31 PM, Álvaro Fernández Rojas wrote:
> Now that there are proper device tree bindings we can start using them.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
