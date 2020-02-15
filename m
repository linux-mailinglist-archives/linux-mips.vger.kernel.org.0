Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1A7815FEEA
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2020 16:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgBOPEB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Feb 2020 10:04:01 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54369 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgBOPEB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Feb 2020 10:04:01 -0500
Received: by mail-pj1-f68.google.com with SMTP id dw13so5277883pjb.4;
        Sat, 15 Feb 2020 07:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=K/TyPbMI9Yl4dIcznykOMiS7aHA5za81j3tfLcMIBAY=;
        b=XzMvwhY33dSzdfC2+679adDzdo100jqmK1wlSp1bz7qv2Bu7ozcJn3OZpT06RhABQk
         A8aRemsbBu52oNYnZN27Aqp45xXmMVdVL+jYWnIM+JNCPW4sddVOqn3M18VtU5vDs8Pd
         +LN/F+RFxl3HAO10ZURG7EQFitIk7Iri4QYh7cnjb0mtD3uKFjcrfJkYS2fHyEm7ZQkO
         7rYavsLMEGyjpv3vbGOejMhdm2LNRdLZm+c0i7EppdF2ANk4sRrkoyW+4d+btS2Ux/28
         aTEdPreVlex7PB5CTjwY9MjEeawyzhj52J5didBAKZaF+AcNiDcnzcKkGyTDSNpBYTZX
         vFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=K/TyPbMI9Yl4dIcznykOMiS7aHA5za81j3tfLcMIBAY=;
        b=hHWiCXp6vDTYpLkMlyu5BV6QYKnVLa0+M7MUo3425GF/APsMbEVk4m2MV8zxXbnBZD
         +wnYh9/Hw8fDI18H2Py0m2L1lwIichbiiSKVBh7J8Rf4fIYPEhaGEK/RGm/gf76ILnph
         gVBtsZFlxUcSVp2h5XWfKkGOfLJPgtPScj+zXYSbStObP6Lo37D2C9gZtKM2gVL+8Xpa
         PshOaARUbk8kko40pt77lK4MshUXL0Y278MxM3UGSf+SRHEM/rTqt87zLzZQOXn6jTu/
         c4dM+KvZhZWLSqjKjmGIiW/nOf9il7QqwYc+4Z1iUIj8CQHyPXYJcYLHLIXEmSY6SRiC
         PKLQ==
X-Gm-Message-State: APjAAAUpTsYDTrraENCVWfUZycGZnYUj+qyzCmVEqbF4bdr/icgG2jW2
        mEQI4s9xJs/Cars+Z7hW5LI=
X-Google-Smtp-Source: APXvYqxmsDB7vB75PiqLtu0d/oaeG2J+Hb46soNx19YmvpxLUdnrCc7x46Ns2W8dBvRBuys/zLl0qQ==
X-Received: by 2002:a17:90a:cf11:: with SMTP id h17mr10209227pju.103.1581779039369;
        Sat, 15 Feb 2020 07:03:59 -0800 (PST)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id u11sm10399093pjn.2.2020.02.15.07.03.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 07:03:58 -0800 (PST)
Date:   Sat, 15 Feb 2020 20:33:56 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul@crapouillou.net, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org,
        paulburton@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com,
        allison@lohutok.net, tglx@linutronix.de, daniel.lezcano@linaro.org,
        geert+renesas@glider.be, krzk@kernel.org, keescook@chromium.org,
        ebiederm@xmission.com, miquel.raynal@bootlin.com,
        paul@boddie.org.uk, hns@goldelico.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mips-creator-ci20-dev@googlegroups.com,
        1326991897@qq.com
Subject: Re: [PATCH v4 1/6] MIPS: JZ4780: Introduce SMP support.
Message-ID: <20200215150355.GA6253@afzalpc>
References: <1581703360-112557-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1581703360-112557-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1581703360-112557-3-git-send-email-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Sat, Feb 15, 2020 at 02:02:35AM +0800, 周琰杰 (Zhou Yanjie) wrote:

> +	/* setup the mailbox IRQ */
> +	setup_irq(MIPS_CPU_IRQ_BASE + 3, &mbox_action);

s/setup_irq/request_irq, see,

https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
https://lkml.kernel.org/r/cover.1581478323.git.afzal.mohd.ma@gmail.com

Regards
afzal
