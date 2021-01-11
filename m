Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9CEE2F22A8
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 23:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390012AbhAKWXJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 17:23:09 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:40940 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389716AbhAKWXI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Jan 2021 17:23:08 -0500
Received: by mail-ot1-f52.google.com with SMTP id j12so413025ota.7;
        Mon, 11 Jan 2021 14:22:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IQlufgY373WHeSQmRTp+GcQDlcL4I2hePr99cDJ+vCg=;
        b=XGOx4Y2qEHvLVyHOxTeZRmVh6X09vAnvCK/9M48CT+HkTT2DQJDuGpHU9x9swf+CF9
         Bh+wy/3jB43ac+EZIfX80uKwQ3uWq/2CM/YHjIbvFfVMj6uQpOQJsnt+rdkHpwbf02UM
         RJgfaakhkjJVNTf/tQo9GQM/QIDiOPEb9oqhtfFt51cOs4C8Xi3lLYECNFslRjZoqw4o
         jyEp+v0awCzDNkJSQS8ODvAnB6P8xIHXw1yCxXw9iaH51tCJDZnmgfzI1O8wRDky70JN
         u90NaFhSDwmzmIRcPvlPPI3SPQqo7sSp+9UKEfB2THvhA2hkQCfyNmdi28K6IQbmZ65T
         RPWg==
X-Gm-Message-State: AOAM532XbVfSEmlCqC6cKb/RcvQSl3GoJOB0Z/lK1D/svsMp0AJKNrV6
        RFquMUb8ZeCaf9t3sJqbGle2QFagaA==
X-Google-Smtp-Source: ABdhPJyx4gGh+yt5Fe3P7nMNJqu53RiCwIPksHDRhoV99oa2Vp7gdtJL+MpJ3QR6ad1g4h9fMKBYmg==
X-Received: by 2002:a05:6830:1b7b:: with SMTP id d27mr894097ote.132.1610403747893;
        Mon, 11 Jan 2021 14:22:27 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f14sm242189oib.40.2021.01.11.14.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 14:22:27 -0800 (PST)
Received: (nullmailer pid 3163975 invoked by uid 1000);
        Mon, 11 Jan 2021 22:22:26 -0000
Date:   Mon, 11 Jan 2021 16:22:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-kernel@vger.kernel.org, john@phrozen.org
Subject: Re: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway EBU
 bindings
Message-ID: <20210111222226.GA3163928@robh.at.kernel.org>
References: <20210101213759.2070-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210101213759.2070-1-olek2@wp.pl>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 01 Jan 2021 22:37:59 +0100, Aleksander Jan Bajkowski wrote:
> Document the Lantiq Xway SoC series External Bus Unit (EBU) bindings.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../bindings/mips/lantiq/lantiq,ebu.yaml      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
