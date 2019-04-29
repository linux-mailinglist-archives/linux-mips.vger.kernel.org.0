Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1559E9C8
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 20:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728966AbfD2SNY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 14:13:24 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38196 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfD2SNX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Apr 2019 14:13:23 -0400
Received: by mail-oi1-f196.google.com with SMTP id t70so3531626oif.5;
        Mon, 29 Apr 2019 11:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2yJIp+wKfF6D2azLlpnnQq6LwUEChuaNxyxk16ryYDI=;
        b=m6IdKAAQFdCRRThSo56yKjCZoh70AzFaEVtjdJTvnrg1T8cSHRHVzUAp4MoGQEjnWJ
         7WkV2J++2J8h8epn3MikeZjJYjdbq6SlTJBCVpag/oDroH9LTuYVm4wIGYLfi6lx25q8
         YEIktqNbDqGxFvJn1Qw7N3PbRPNeFA5OJQzA8l5CBVrEKPX4ac16irV4xEP8Cughdd5A
         RrhTHs931a0xuIRiUqTRJZPx7OgSo1BnDG114hV85ghNr16NaIxwHDhcnu73F+aeHk2j
         +G24R/POh7Az9kC17mQXs4zTenCVBWDtpRJw+RtvDb9SYys0OsHfY2t7Nu4yNp1v3cld
         XBtA==
X-Gm-Message-State: APjAAAXz2DafGq4/p7tCcbbEx+p2/QFCTkxuEmj24XT3q3BLw3jULHLU
        Z3IKWyH5VJ6iT5TbWMN9JQ==
X-Google-Smtp-Source: APXvYqz9b40VqbrX7kX0FUjzkjH2lmhVUpYjf06BckfNOK7wqQ5vew2gsC+yMkKMkAKXerqDmMYF0A==
X-Received: by 2002:aca:5256:: with SMTP id g83mr276496oib.61.1556561603068;
        Mon, 29 Apr 2019 11:13:23 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w10sm14305916oiw.48.2019.04.29.11.13.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 11:13:21 -0700 (PDT)
Date:   Mon, 29 Apr 2019 13:13:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        paul.burton@mips.com, robh+dt@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: Add vendor prefix for loongson
Message-ID: <20190429181321.GA6862@bogus>
References: <20190312091520.8863-2-jiaxun.yang@flygoat.com>
 <20190411121915.8040-1-jiaxun.yang@flygoat.com>
 <20190411121915.8040-5-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190411121915.8040-5-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 11 Apr 2019 20:19:13 +0800, Jiaxun Yang wrote:
> Add vendor prefix for loongson, known as
> Loongson Technology Corporation Limited, a CPUs & IP Cores vendor.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
