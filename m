Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718802BBF48
	for <lists+linux-mips@lfdr.de>; Sat, 21 Nov 2020 14:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgKUNbC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Nov 2020 08:31:02 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:46277 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727835AbgKUNbB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 21 Nov 2020 08:31:01 -0500
Received: by mail-qt1-f194.google.com with SMTP id f15so5833166qto.13;
        Sat, 21 Nov 2020 05:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DRct7Qiz1NdHJ+XJtu4ATcXpdEh8Oy5keY5R6mGzDQs=;
        b=YS3LUob9jUbXrs9nHQl2mQ40/VQnBNSrxLJ1gQUsfnVGg5ZSRapUJBEG9B9iqOirhf
         ZgQbYXgHKXpeCIxxgVnfsmTsdUrnjHI1EYMMRZYnT5lQ8/2S3wjGYkxifCEapW+F7Uti
         +YgYoKMRFf0NZbGyeMJ+ICdK3E8zc/RCYuqy7kI+eJq7eipYjzyCra1DgIBZ0D+SYnSd
         o0iR15gDnJEi9cZP6Q8JibWnlCSPFAdshARSzzjUdPeESQeqPbBV67S41f6wbMEopcLn
         cX+CfjbKy0h7xwlXHnD0ELFdGlgZk0f686KvBCOIoZqkUg7+mOuUa4GxhZ/uvIO1bUY5
         nQeA==
X-Gm-Message-State: AOAM5324YYchIZUqdxNkoF+AJFVN7Mfdw32VL7kTkJDLFH5YVB2RE1aq
        E1UtV/f7p/C6RdTdFmJ45w==
X-Google-Smtp-Source: ABdhPJwxUXBcSJ0PMTqXgEHiurkz3GntUDhncIYmfII33t3GmLNIS7tspLTDzp4JbRXfF8EEU9bw/g==
X-Received: by 2002:ac8:36bc:: with SMTP id a57mr20501605qtc.193.1605965455403;
        Sat, 21 Nov 2020 05:30:55 -0800 (PST)
Received: from xps15 ([172.58.99.237])
        by smtp.gmail.com with ESMTPSA id 9sm4167517qkm.81.2020.11.21.05.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 05:30:54 -0800 (PST)
Received: (nullmailer pid 2129529 invoked by uid 1000);
        Sat, 21 Nov 2020 13:30:50 -0000
Date:   Sat, 21 Nov 2020 07:30:50 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     john@phrozen.org, linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, jiaxun.yang@flygoat.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        tsbogend@alpha.franken.de, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        neil@brown.name, robh+dt@kernel.org, hackpascal@gmail.com
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: add dt binding header for
 mt7621 clocks
Message-ID: <20201121133050.GA2129481@robh.at.kernel.org>
References: <20201113154632.24973-1-sergio.paracuellos@gmail.com>
 <20201113154632.24973-2-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113154632.24973-2-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 13 Nov 2020 16:46:28 +0100, Sergio Paracuellos wrote:
> Adds dt binding header for 'mediatek,mt7621-clk' clocks.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  include/dt-bindings/clock/mt7621-clk.h | 41 ++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt7621-clk.h
> 

Acked-by: Rob Herring <robh@kernel.org>
