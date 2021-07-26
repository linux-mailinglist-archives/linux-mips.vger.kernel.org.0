Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C816C3D6952
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jul 2021 00:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233618AbhGZViG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Jul 2021 17:38:06 -0400
Received: from mail-io1-f48.google.com ([209.85.166.48]:46004 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232875AbhGZViC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Jul 2021 17:38:02 -0400
Received: by mail-io1-f48.google.com with SMTP id l126so13766386ioa.12;
        Mon, 26 Jul 2021 15:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=C5gB6d/BxYxUIn7hm11QVMthPhNQE6A/5LH80fUpgs0=;
        b=eXbuJduUI1E4pBSAeuL5uTkM448jlMD97+3KIyhJU0Oam73K9XPoqGMuF0lQSfgcoa
         e6enh+5Qhvk73NEbosXVbEawpkERjWo6F4ud9HAG3Hae2vp7JI+GQciiu2RYAfsxiYmO
         qkE26dAxuePWSTvyV8QQFjAa5b9Za9lIc0xA0f7qWvCIzYYkETQda9eG/SyYJgomBiyG
         wAMY95wsLqLoAeRiFZpKOd0dBhcTznTFF5Cx9WP1v6giIULP72Mt9OsNfza6F+HsaQ8v
         MGDyxd7L0fvhzWdbzRpVpLJEVdNWT7yvI+WGNe2uMGCCX8GK6Rw4L22lnt27tosA59fq
         2kHQ==
X-Gm-Message-State: AOAM532HWeOjEF7fBBXERo5E/KmSjEBjKXLmQTFHBHuHF3cuTCtpknsO
        m1EoVYJHoJ+iXYhTvwMD8g==
X-Google-Smtp-Source: ABdhPJwkBdWOm/gnpFHPqH6oSqB74bRGrhs6/JGQEDqsOqM5sQv2Szc4U8MiWZoVkua3jMO4TJWEQQ==
X-Received: by 2002:a05:6638:388e:: with SMTP id b14mr18359311jav.113.1627337910227;
        Mon, 26 Jul 2021 15:18:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z18sm541561ilh.55.2021.07.26.15.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 15:18:29 -0700 (PDT)
Received: (nullmailer pid 972077 invoked by uid 1000);
        Mon, 26 Jul 2021 22:18:27 -0000
Date:   Mon, 26 Jul 2021 16:18:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     jun.jiang@ingenic.com, paul@crapouillou.net,
        dongsheng.qiu@ingenic.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        sihui.liu@ingenic.com, mturquette@baylibre.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sernia.zhou@foxmail.com, sboyd@kernel.org
Subject: Re: [PATCH v7 08/11] dt-bindings: clock: Add JZ4775 clock bindings.
Message-ID: <20210726221827.GA972036@robh.at.kernel.org>
References: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1627119286-125821-9-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1627119286-125821-9-git-send-email-zhouyanjie@wanyeetech.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 24 Jul 2021 17:34:43 +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add the clock bindings for the JZ4775 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v5:
>     New patch.
> 
>     v5->v6:
>     No change.
> 
>     v6->v7:
>     Change to dual license.
> 
>  include/dt-bindings/clock/jz4775-cgu.h | 59 ++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 include/dt-bindings/clock/jz4775-cgu.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
