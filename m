Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC9821A8F3
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 22:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgGIU1v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 16:27:51 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38480 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGIU1v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 16:27:51 -0400
Received: by mail-io1-f65.google.com with SMTP id l1so3739233ioh.5;
        Thu, 09 Jul 2020 13:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Qb94QxN3uGp9VE0otX3GF3kFz4WlvCb3LoCmA/+a6eE=;
        b=Tyt+iGqVgqX99zgXqneI8ntyA2IYX0UpEz3t7UyiSswqcDCDQeqEbQsfH1KH5eT0Bs
         6/oFZcBJaeGxlB9Cma5lBBz8VtTwrZx5Q09o9hduqW5n61El3lpgoBketOoaSQUoHShl
         bW+8/1LY/DOs1sF+UWPi8xJM08yBh0cCXeq8vhoZNxcu8Yn1IBklnBreK8MUcCPmLo7I
         TIiByoa2voLMzafCx8hSZV3uo0VtpoSiyJuvWah+RqDHAXJphURefGIqgEvBZnqnJU5D
         XnvSMUju0i5hJd7mxPJF7PKtHfSUjh3STZh398g7jLkABIMRKcFp+q4rIRn2+pI2itus
         w6mQ==
X-Gm-Message-State: AOAM531gEzjScY9OS5HamQapVX0xMhS3Bo0QJwdxtmbK1ahiEGwyU2TV
        ilSZaqIkERGXscMD4sGTdA==
X-Google-Smtp-Source: ABdhPJxpWBwCY0GBkF3D9Oi41JcK85HHGN5nOVEJnKw15wjP1ay6xtI38Byeq0HU+q8s7r9PeqOq5w==
X-Received: by 2002:a6b:7106:: with SMTP id q6mr43593665iog.122.1594326470272;
        Thu, 09 Jul 2020 13:27:50 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id m5sm2346109ilg.18.2020.07.09.13.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 13:27:49 -0700 (PDT)
Received: (nullmailer pid 833396 invoked by uid 1000);
        Thu, 09 Jul 2020 20:27:48 -0000
Date:   Thu, 9 Jul 2020 14:27:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     tsbogend@alpha.franken.de, p.zabel@pengutronix.de,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        jonas.gorski@gmail.com, f.fainelli@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH v7 7/9] mips: bmips: dts: add BCM6368 reset controller
 support
Message-ID: <20200709202748.GA833349@bogus>
References: <20200617105042.3824116-1-noltari@gmail.com>
 <20200617105042.3824116-8-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200617105042.3824116-8-noltari@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 17 Jun 2020 12:50:39 +0200, Álvaro Fernández Rojas wrote:
> BCM6368 SoCs have a reset controller for certain components.
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
>  arch/mips/boot/dts/brcm/bcm6368.dtsi      |  6 ++++++
>  include/dt-bindings/reset/bcm6368-reset.h | 16 ++++++++++++++++
>  2 files changed, 22 insertions(+)
>  create mode 100644 include/dt-bindings/reset/bcm6368-reset.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
