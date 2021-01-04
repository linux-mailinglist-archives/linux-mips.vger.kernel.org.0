Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9C42E9B03
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 17:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbhADQ1S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 11:27:18 -0500
Received: from mout.gmx.net ([212.227.15.15]:33961 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727522AbhADQ1R (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 11:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609777542;
        bh=CDNGOwP9TM0DOdFMPBqhwZowdR/yhxNQD6C84wLQ38k=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=inhErgRjHXQK/4P+7c/qqGK1VUS4HzH5rR+IAmYBzPzMWcAO2FbOH8xDTjZZmeH7N
         CDGwS7cb/srL65WGEX9kWu+3Pjf9zI7IYpWhGBEPzTZe7AUUVehuYqr3aYID4Qv9gB
         PR/+3jp4YbR7KphSdsmEuNjI7356vNtW/+p+2D/M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N5VDE-1juFLz47b8-0171CA; Mon, 04
 Jan 2021 17:25:42 +0100
Date:   Mon, 4 Jan 2021 18:27:20 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Keith Busch <kbusch@kernel.org>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org
Subject: Re: [PATCH 6/6] block: Add n64 cart driver
Message-Id: <20210104182720.48a9d74b2b55f5978735eaba@gmx.com>
In-Reply-To: <20210104161332.GC1024941@dhcp-10-100-145-180.wdc.com>
References: <20210104155031.9b4e39ff48a6d7accc93461d@gmx.com>
        <20210104154902.GA1024941@dhcp-10-100-145-180.wdc.com>
        <20210104180115.b1d5438cd4ee21efcd557976@gmx.com>
        <20210104161332.GC1024941@dhcp-10-100-145-180.wdc.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GBEgToGuOetdmPOqcMXXTrtguJGwqqP5HvVUXAifGdSFTAgX5J1
 WE9gwxZnR3BCIhB6UIovGCaiVZCRWuLrisEcVL/8yZq8eAPFqSB8rqJB9GGUns0o5YkydGu
 30JmKFGoqFi28zlGhzu1V1yN4+jJObKT2jODAEXPR7gkQCIEpeOO/VloY3qG397AEqVgSzu
 Ov+LFNG+Dpwcgse92E2BQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IZ+ISEV9vQw=:Uo9fu+0nJRmDK8sSo/N/lb
 dd4R9MyDwsZ3FOkUHPQyDY/Xi4ndH53occxwj9utEbLStWdkk3cjTmKUtqWJNgRzgcBMGAQqS
 jwAjKikeXWpgmaDOeTEK7qNNyYH75XTP1R8jCB47uWp0a1KZU41xjKhHRxqCS0AQ02IR5X1cM
 97YzjO2uPP+vFQiGWGCrGvKXrjlzdxzn1T624aO+uzEvkcGNO+81hD11caWKSz5mbHO6VIr+L
 Zi+WmXCOosx57J0PDw0FkTUXyuHn1t3PdpI9SUZVR8VKgELeqWthjhNeb4k84beAq8H0yv1fe
 oGDCLxIWd1Vxj8gVcxaPCGraGISdLI0PjSLSQ0GOjAJz+sOa2JqLDnLemkkHfXxK14qOOun93
 yt/Zny5UQwelW+xqPxX20JBsnW8h5PbTF+WEXslBCgNieT0aqYjbQN7FhqHZLJ55OeugEIXNN
 Pbb7/snuYb+hPrfjNwyjajcVSXr/u8CD54qEGz3zq3+l/wFLeCtWIeGx285tF/upTpKkmo+3r
 kmszNwOza6A6+ewOyZKggsXbvG+JBMAFSnOFBfjYn6FiDLXT13ZhP8bf3qynXaopAv6AQqgeq
 W8lIZernx7s99Ue0F+wfHlFeiqSiyvz12jHy4rTFUO6WGbfmfmZ/tEAR0TX4WdT6uCapC9kFh
 3klgFzMHZnOwahn48VU9x00MP/91caqBDpVBALZeokvJSRPHBMaXdvwRo4l8AqhZM1KL49niT
 DOHjb+H0Y7w3JIQPdkYDWa/KIOZjn1Tzm7mGZnVwIe3SjOwnQGQlDdo3lD767gzUO1A6UoAR+
 Zcu8mw1Aeqlf7IMyRYrj82UMWJzFoKR99KE8iqVz249AUrCsdTKC1nJ22JxwcvvwlYd/ncDEs
 5lT3eMdcEMwx/DibS7wA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 4 Jan 2021 08:13:32 -0800
Keith Busch <kbusch@kernel.org> wrote:

> > The media is read-only (but not runtime removable).
>
> It's been a while, but I could swear we can save state on these carts.
> If so, it sounds like that must be separate from the media this driver
> is accessing, so is that capability provided through a different driver?

Saving uses a separate mechanism, and there are several depending on
what type of cart it is (no saves, flash, eeprom, or sram). If the cart
has no save possibility, there is an optional memory card attached to
the joypad controller.

Currently there is no driver for any of these.

- Lauri
