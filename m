Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47C3F6A447
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jul 2019 10:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbfGPIwm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Jul 2019 04:52:42 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40319 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbfGPIwm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Jul 2019 04:52:42 -0400
Received: by mail-lf1-f67.google.com with SMTP id b17so13092262lff.7
        for <linux-mips@vger.kernel.org>; Tue, 16 Jul 2019 01:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XyQtv8q/vojaY1D+1nE9nEqdizDyuspw+4fU4V90wfg=;
        b=h5BnzYaeTvOlH06pndcuIZMyPpXzgZFv4CdRfrazxDwaTYTWGAhMJJ113o9/HjLPTl
         TEKInE1moxeMIIt89WjjbS2JZFvGkRLPTRDv1889fKRSTRMXTNHjkdUyw2PkC7jM5Hxn
         I+c75HbDAdEdXRHgyTOvJopT6y8fD36j8m4ioAgiDjfJfoe80ioBjSFCUrZMLWOK35vu
         ozPXP2/NFlcAjlO3NqDmZk5WVgnyNeJVB8GEfiA23X8fbX5Qgn7czCxhqRGffjSA1X2W
         iGIfE5dg15UGF+WGh6o53294EcQDsG9M3FTzfifZVytZz0mY/KsQNrho5379BJ7cKtYu
         4OtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XyQtv8q/vojaY1D+1nE9nEqdizDyuspw+4fU4V90wfg=;
        b=fngl0hadtEkIB/Km8OTsxlMy+cqnvUFoCN5qXA3p/WEHsEqoh39CyZVT5Se/89Jn6N
         z+GBODtEZASSe6TI4lJWvpnXS+TClw3d2egiO/xFMwLCW62kyNTWbitXVKhkmfEpBja2
         cBmGCxf0j/soVYAbRwrIgxGjUYUxgo76M8EY7BQibOTXKw2jORuIZsIHNFiSmuHg3sBZ
         +scGtzzPMgYtUwDAojb/YfdAyHF7B3TDpFIiXIsJ8iQH1g9V4gNFBbcE5FysFtqco5Sh
         /MHY0Jj6gUufIMVQSwdB1gUBgIemZNtBGgW7yWrFk21x5HRZqYHWbnL8kV/B6gsbiNWN
         PYXw==
X-Gm-Message-State: APjAAAV4NENHAni2qqy+xNUnZJvIgFAWPJ0Ua2dujNRZK2xsxwV0Wa7p
        ZRdLl+0S1W5Zw/Z22PaOD2GFnibq77Guxw==
X-Google-Smtp-Source: APXvYqwYuqhrW3TJhCJZ7PX4BmU4vW0ooe7NeWyaoHIu87HRNCS59SvmIGeZ1Cdj5vYOEfwejxR2oA==
X-Received: by 2002:ac2:5231:: with SMTP id i17mr14127734lfl.39.1563267160476;
        Tue, 16 Jul 2019 01:52:40 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:486f:abb9:dd58:ac0e:e00:e686? ([2a00:1fa0:486f:abb9:dd58:ac0e:e00:e686])
        by smtp.gmail.com with ESMTPSA id i62sm3577698lji.14.2019.07.16.01.52.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 01:52:39 -0700 (PDT)
Subject: Re: [PATCH] MIPS: Kconfig: remove HAVE_LATENCYTOP_SUPPORT
To:     Fabian Mewes <architekt@coding4coffee.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190715160849.25964-1-architekt@coding4coffee.org>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <77754e88-ff5d-2021-60f5-80417d61763c@cogentembedded.com>
Date:   Tue, 16 Jul 2019 11:52:28 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715160849.25964-1-architekt@coding4coffee.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 15.07.2019 19:08, Fabian Mewes wrote:

> HAVE_LATENCYTOP_SUPPORT was removed all together in da48d094ce5d7.

    You need to also specify that commit's summary enclosed in ("").

> This commit removes a leftover in the MIPS Kconfig.
> 
> Signed-off-by: Fabian Mewes <architekt@coding4coffee.org>

MBR, Sergei
