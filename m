Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6928B1E6C3B
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 22:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407128AbgE1UPw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 16:15:52 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:33221 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407121AbgE1UPZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 16:15:25 -0400
Received: by mail-il1-f195.google.com with SMTP id y17so251629ilg.0;
        Thu, 28 May 2020 13:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BXCOzsIUMuL9qCMMyPDnYca7W+adm7GlWP9n8qil7t8=;
        b=tnXEQ60AW++ksO6rItOg9uzCaFmLBfOj2QfEHB+vET6Eww0qFYt3bnNOZ//2nS/QRz
         QOwNWmh7Gim/izarYzCe+E1XgtR6XvRYNgXFbcaNnvdq/zQdSyx07Ombf6kzKhEmgOEF
         M3U2zsdMK7xrDGy816PtcMvQq0uyYQHD5QxKCcsdoHLMpOwEQivKDch997sPDdzVEc3K
         Gep5T0TE4YVQL2OchQYPZBx9fLWs5qz1mpa772+Vz2Iwkwbjsfkyj/0H/nMFmv4qC/Ek
         d/j1u/6ZPGRbH0OEg9OtvgKTSM6B/vJCRWll6FgVJbiXH5V/LaXZyqm5sydiVTS7Z4WA
         2LEQ==
X-Gm-Message-State: AOAM533tQO8retIbGmHKekvx9uJdmS2XBhG8o5Azi60W0aKQx26N/wxh
        7WB+OWqMPCOIYd+1YFksUQ==
X-Google-Smtp-Source: ABdhPJwo/iLc8Cnz96JasVzN6Abh5cLjpPgW5zpEMLoij4skMZc5+xcRcrZINwMMDxfM/J93MPvj0A==
X-Received: by 2002:a05:6e02:6cf:: with SMTP id p15mr4603527ils.146.1590696924234;
        Thu, 28 May 2020 13:15:24 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id 129sm2793577ioy.0.2020.05.28.13.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 13:15:23 -0700 (PDT)
Received: (nullmailer pid 605848 invoked by uid 1000);
        Thu, 28 May 2020 20:15:22 -0000
Date:   Thu, 28 May 2020 14:15:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-mips@vger.kernel.org, maz@kernel.org,
        Huacai Chen <chenhc@lemote.com>
Subject: Re: [PATCH v4 4/6] dt-bindings: interrupt-controller: Add Loongson
 PCH PIC
Message-ID: <20200528201522.GA605801@bogus>
References: <20200427060551.1372591-1-jiaxun.yang@flygoat.com>
 <20200516082912.3673033-1-jiaxun.yang@flygoat.com>
 <20200516082912.3673033-4-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200516082912.3673033-4-jiaxun.yang@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 16 May 2020 16:29:04 +0800, Jiaxun Yang wrote:
> Add binding for Loongson PCH PIC Controller.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> --
> v2:
> 	- Fix naming
> 	- Mark loongson,pic-base-vec as required
> ---
>  .../loongson,pch-pic.yaml                     | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
