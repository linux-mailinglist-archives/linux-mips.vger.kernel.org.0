Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D54121A8EE
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 22:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgGIU1i (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 16:27:38 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37375 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGIU1i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 16:27:38 -0400
Received: by mail-io1-f68.google.com with SMTP id v6so3739297iob.4;
        Thu, 09 Jul 2020 13:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yQ9BG5486yLgoKCyU5CYxsGi5Y3h+0YJxtoTbLoHuaE=;
        b=YLrra0DG7PpxMnGZMtWzNZacagReH5PZL+tbybygLPF4PTKjZIvS2N60cOeC2CplFy
         r10dlEZdj1NBG6/rqnu1HB1DxHi8Zi1M7GebZirVjiVBucmntzOj1w4Cr+KsdxL+wZ7I
         PtfeL+jHsZZYkiiRztepxEGDcuwA0m2nRy95wsI4j4Uxo0xiwlKuHNY3E0zK5xNBNUXP
         0oQCVOQVnddru/rTWu8krSzFEGcJ6vNOvkVqbsZ7O5+L1bFgZx4QuFccvLLi7qYf7DIE
         jYdF590rv+6iD077e5XmWS6aTQCZbANChTZSf1g1FR/tE8q+NvKdF/ah8elUvpP1Cet1
         u0ZA==
X-Gm-Message-State: AOAM530qMHHTq744PDP3ymm4z5rJov55pVEqnw0yg36YVgxSpc/HkAEZ
        R7EYSNBktBlw+GTSpNdm2Q==
X-Google-Smtp-Source: ABdhPJz5Kynf8h5cGRXrqwM1a9QQDTcjFc6syuFsfOrHnHI5voQuHU9uBRZzWqXLaqTKYkSOXS8UzA==
X-Received: by 2002:a05:6638:601:: with SMTP id g1mr75349380jar.137.1594326457335;
        Thu, 09 Jul 2020 13:27:37 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id c29sm2546342ilg.53.2020.07.09.13.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 13:27:36 -0700 (PDT)
Received: (nullmailer pid 832996 invoked by uid 1000);
        Thu, 09 Jul 2020 20:27:35 -0000
Date:   Thu, 9 Jul 2020 14:27:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     p.zabel@pengutronix.de, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, tsbogend@alpha.franken.de,
        f.fainelli@gmail.com, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        jonas.gorski@gmail.com
Subject: Re: [PATCH v7 6/9] mips: bmips: dts: add BCM6362 reset controller
 support
Message-ID: <20200709202735.GA832942@bogus>
References: <20200617105042.3824116-1-noltari@gmail.com>
 <20200617105042.3824116-7-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200617105042.3824116-7-noltari@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 17 Jun 2020 12:50:38 +0200, Álvaro Fernández Rojas wrote:
> BCM6362 SoCs have a reset controller for certain components.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  v7: no changes.
>  v6: no changes.
>  v5: no changes.
>  v4: no changes.
>  v3: add reset controller definitions header file.
>  v2: no changes.
> 
>  arch/mips/boot/dts/brcm/bcm6362.dtsi      |  6 ++++++
>  include/dt-bindings/reset/bcm6362-reset.h | 22 ++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 include/dt-bindings/reset/bcm6362-reset.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
