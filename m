Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B64B712FDC
	for <lists+linux-mips@lfdr.de>; Fri,  3 May 2019 16:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbfECONK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 May 2019 10:13:10 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44779 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727397AbfECONK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 May 2019 10:13:10 -0400
Received: by mail-wr1-f65.google.com with SMTP id c5so8056732wrs.11;
        Fri, 03 May 2019 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/WgYbCKE2WHmEu4CJzMjz8r9bF+PC2uNvvqT2nxvljU=;
        b=f4+A6pUUh4b1EpMQn5QcG8YGsXNl/i6t1dRn6GvCmXwLUYfD6vW82SSD1oLfN53QC2
         LDYQYQKcFcbA2ZPw5ffllqtyr73j4WSE4BETRHzArcTO7tV800sxeOKGV9WVkd4kUtdy
         Z5hU/Jn/O91OdS7wPTokX2xdTZ+OFwm9e27BoX9ABz/DjF/iguaJbqc/AWoBhwBj289m
         xTSlxfhv3yo3dIyMW9z+IIrUDPVQ2sqLEt1nWNtS9/QlXOqBV1VnyUIcMf4+MnX4EX1m
         MR592zcDrRBtBiI3RKlkv/9CTfjYEyI4PBtMu39d6qnBrLtmVsOeiS8ja7CqxeukrHdZ
         v28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/WgYbCKE2WHmEu4CJzMjz8r9bF+PC2uNvvqT2nxvljU=;
        b=axpuBx+KP9nCSVI6MhVz9rbVDJNli+bkKYhYrbHNG4dJUHVt1JCviRCznixsHy47Ty
         D+mWywKEMv9mwy56k7fADXkGIoDxk13o+TPyxmuQ5+aySB0REyNzV5UZ68/0kymHFkoN
         t+e4JEfRQN+JnN5rEtEOZ/3ekiV+4t2DUYwX2+vYk41k1UiXnNH1tok/D2TBsnAPJp6V
         usgtEfnQkrgQ4mgunm2edQ/RWsMD/NEsBvsb3NhpkGya5p4uBF0xCWLvt5R3k2QQBi+Q
         24mLQILd5pteMwEe5vFh8ctfT1CWGiaPLPx5io9tcajXKVtchL4GpRUAXtJqKD36vzLA
         WvHg==
X-Gm-Message-State: APjAAAWw7wWU14XG8NqxzJHINqVRyhycxW/5SwRWI91DD87S8qRUg07Q
        BHOqnCY1kyRZdv3/z5uqU+8=
X-Google-Smtp-Source: APXvYqwXeAYzjzfsJE1irjCmCsPKO6J3HFWMsQCcRoJPGEUoT6BCZR4LXtx6GXMWwgW/s4EmH+aRkg==
X-Received: by 2002:adf:e8c4:: with SMTP id k4mr7553656wrn.9.1556892788449;
        Fri, 03 May 2019 07:13:08 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id z6sm2432874wrw.87.2019.05.03.07.13.06
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 07:13:07 -0700 (PDT)
Subject: Re: [PATCH 2/3] clk: add BCM63XX gated clock controller driver
To:     Jonas Gorski <jonas.gorski@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Kevin Cernekee <cernekee@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-3-jonas.gorski@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <a8e757f2-c8e8-8aff-0d88-ef86b8241be7@amsat.org>
Date:   Fri, 3 May 2019 16:13:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502122657.15577-3-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/2/19 2:26 PM, Jonas Gorski wrote:
> Add a driver for the gated clock controller found on MIPS based BCM63XX
> SoCs.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
