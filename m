Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71CBC46080C
	for <lists+linux-mips@lfdr.de>; Sun, 28 Nov 2021 18:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233844AbhK1ReN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Nov 2021 12:34:13 -0500
Received: from mail-qv1-f44.google.com ([209.85.219.44]:42833 "EHLO
        mail-qv1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbhK1RcM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Nov 2021 12:32:12 -0500
Received: by mail-qv1-f44.google.com with SMTP id p3so4930124qvj.9;
        Sun, 28 Nov 2021 09:28:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8t7zEN2QQmXKThX8D5L+6eT0VEeaElEC24NQV1qwwuE=;
        b=2ZCf/g+f1/7vHpDsKos1AZF3yelSw5RkLKxD8CGYkFmGwF0Ejf2siXiy2kQ2s4+EBK
         vREtiCAlV68zLfCM8/5sWf2XNTZxo4qvo1Ip6ZyJGpSAXELqWWboB3+rvWVaLaSkJIKw
         fSXDbuoivwNCEjc7NOrVOQnxrahpCFQPvnipIHfhc1AS9ZCNKxi4tCWeB2jID0OG8tY1
         aWgTEUpEQnzGP/05HE4PEPTmZJFUz1qoa+Cbb8ZYOdhEUxUsV1WDrhZenfC052ufhamg
         n4tbWHjWUQu/gJnSYeyYbrNMTfL5Rc/c3YxK4AaYyFbghLX0gYHVbUwpyt1bAmY/nGTd
         lA/g==
X-Gm-Message-State: AOAM532EJnySkWQxLRiJqumnyw53IxORyaocOWZzmxabXl82f39xDgD/
        4ICmuAjXWx8u8W++nkViiA==
X-Google-Smtp-Source: ABdhPJxLc8Gvqt56vIdZd6DmQRJnw5iIP2WyzcQ+pKVq95M2yU9HcrhuBjgCX0CJD9Cg/AMBbQCJXA==
X-Received: by 2002:ad4:5046:: with SMTP id m6mr24694492qvq.116.1638120535696;
        Sun, 28 Nov 2021 09:28:55 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:2edc:4e01:e871:814a:5254:ea69])
        by smtp.gmail.com with ESMTPSA id s6sm4554934qko.43.2021.11.28.09.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 09:28:55 -0800 (PST)
Received: (nullmailer pid 2771388 invoked by uid 1000);
        Sun, 28 Nov 2021 17:28:51 -0000
Date:   Sun, 28 Nov 2021 11:28:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v9 3/3] dt-bindings: mips: Add Loongson-2K1000 reset
 support
Message-ID: <YaO8U94hsQhNnJ0p@robh.at.kernel.org>
References: <20211126015216.26605-1-zhangqing@loongson.cn>
 <20211126015216.26605-3-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126015216.26605-3-zhangqing@loongson.cn>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 26 Nov 2021 09:52:16 +0800, Qing Zhang wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
> v8-v9:
> only modify 'make DT_CHECKER_FLAGS=-m dt_binding_check' warnings/errors
> ---
>  .../bindings/mips/loongson/ls2k-reset.yaml    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/loongson/ls2k-reset.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
