Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDAF16E9BEC
	for <lists+linux-mips@lfdr.de>; Thu, 20 Apr 2023 20:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbjDTSvL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Apr 2023 14:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbjDTSvH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Apr 2023 14:51:07 -0400
X-Greylist: delayed 511 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 20 Apr 2023 11:51:00 PDT
Received: from xry111.site (xry111.site [IPv6:2001:470:683e::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F712D58
        for <linux-mips@vger.kernel.org>; Thu, 20 Apr 2023 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
        s=default; t=1682016657;
        bh=aOUOncamuei97Vu6sivVlt041a1msFjzaF6U6ySdhyo=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=S8PyOqu04pGaR4bVpGhUhQCdT+EevZ6qo2jJPGXFyaqD2sWInj9lzHU+ZuAPdscVF
         7DtEtS6fi0w/ssAidneNLViBRNxtAX5jStdzPJ2b+8k4QaK9vKrX8j2cs6WszCrLzH
         vGEECDWuZD/xASVPp0MIVavcXpBPrFU3C1Nxrj2M=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
        (Client did not present a certificate)
        (Authenticated sender: xry111@xry111.site)
        by xry111.site (Postfix) with ESMTPSA id 20B3066144;
        Thu, 20 Apr 2023 14:50:55 -0400 (EDT)
Message-ID: <18c7a2891d8a192f4a88b10d403baeaa8b31797e.camel@xry111.site>
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if
 unsupported
From:   Xi Ruoyao <xry111@xry111.site>
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name,
        loongarch@lists.linux.dev
Date:   Fri, 21 Apr 2023 02:50:54 +0800
In-Reply-To: <c91beae684ba1f45d22be1f3d8542c89711df6a7.camel@xry111.site>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
         <20230414080701.15503-7-jiaxun.yang@flygoat.com>
         <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
         <550FCA0F-2C48-4133-85B0-D9494CC1C23C@flygoat.com>
         <CAKwvOd=sNyOq9J=CS09XXQ6YY3y3ytLnwHxKoHNdddcxYk=nJQ@mail.gmail.com>
         <20230419221500.GA17797@alpha.franken.de>
         <CAKwvOdkZA6DVCbgF=P1xZcHiyGFTnYvGReJZTzVnmeZdsH0L3w@mail.gmail.com>
         <c91beae684ba1f45d22be1f3d8542c89711df6a7.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 2023-04-21 at 02:42 +0800, Xi Ruoyao wrote:
> Hi Nick,
>=20
> On Thu, 2023-04-20 at 09:32 -0700, Nick Desaulniers wrote:
> > Separate question to Huacai, Wang, and the loongarch list; I know
> > LLVM
> > landed the Loongarch backend recently; any idea what's the status of
> > building arch=3Dloongarch with LLVM=3D1 (linux kernel)?
>=20
> AFAIK there are some issues not resolved yet:
> https://github.com/ClangBuiltLinux/linux/issues/1787

I must be completely stupid: I didn't see you are the one raised the
ticket :).

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
