Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F50246F51B
	for <lists+linux-mips@lfdr.de>; Thu,  9 Dec 2021 21:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbhLIUoo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Dec 2021 15:44:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbhLIUon (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Dec 2021 15:44:43 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCA2C061746;
        Thu,  9 Dec 2021 12:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:References:
        In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=uSyJMaW/SvNLnUFnRFZXYo5bhsJ8p/CGtudZrQrj4OQ=; b=qLim/VmXvC7vp7q71i6566MgaE
        iEGThHcNVJgT9xg0Lx3nWKF+fjIm0NwTy4faSGUnkCTBSzTsAVQ1MoYDN0vuni8YbD++MjZSWy9ZH
        znm3vR0hVxSINhDva+MZb3FUGrWNlO7JGMTX3yK+eTwhpE5ltt+I0ifJBvSIrnp1IwbuZhBLXwlJV
        SVR1OwtMg/ugxmR0B3OK7X0m3n3FEK60MCpLiOtluztVKtjgkLyRGfZnh3ElZ0b8KqKWPLGeueDUQ
        4tBejdGK2z8jgnaRkUsA1LVE96cBD/CIkPWvwoGb+Lg40YIsaNZ2QurShEWh1q16Z4vGjUysRoVwd
        oZpm4SeQ==;
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=freeip.amazon.com)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mvQDn-00HVUV-CH; Thu, 09 Dec 2021 20:40:55 +0000
Message-ID: <b614d9ae0fe7910cfa72eee0b4077776f8012e5f.camel@infradead.org>
Subject: Re: [PATCH v5 08/12] KVM: Reinstate gfn_to_pfn_cache with
 invalidation support
From:   David Woodhouse <dwmw2@infradead.org>
To:     Paolo Bonzini <pbonzini@redhat.com>, kvm <kvm@vger.kernel.org>
Cc:     Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        "jmattson @ google . com" <jmattson@google.com>,
        "wanpengli @ tencent . com" <wanpengli@tencent.com>,
        "seanjc @ google . com" <seanjc@google.com>,
        "vkuznets @ redhat . com" <vkuznets@redhat.com>,
        "mtosatti @ redhat . com" <mtosatti@redhat.com>,
        "joro @ 8bytes . org" <joro@8bytes.org>, karahmed@amazon.com,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Anup Patel <anup.patel@wdc.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        butt3rflyh4ck <butterflyhuangxx@gmail.com>
Date:   Thu, 09 Dec 2021 20:40:48 +0000
In-Reply-To: <b1bacc6f-be56-4108-6e52-4315a021184b@redhat.com>
References: <20211121125451.9489-1-dwmw2@infradead.org>
         <20211121125451.9489-9-dwmw2@infradead.org>
         <b1bacc6f-be56-4108-6e52-4315a021184b@redhat.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
        boundary="=-tGdrPlP/CxoRpyQj0J8H"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--=-tGdrPlP/CxoRpyQj0J8H
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-12-09 at 19:34 +0100, Paolo Bonzini wrote:
> Sorry for the late review...


NP, very useful fixes. Thanks. Incremental patch looks like this. It
passes the xen_shinfo_test self-test; will test it with real Xen guests
tomorrow and repost based on your kvm/next tree once it shows up.

diff --git a/virt/kvm/pfncache.c b/virt/kvm/pfncache.c
index d8c6e1d4a647..9e3c662f815f 100644
--- a/virt/kvm/pfncache.c
+++ b/virt/kvm/pfncache.c
@@ -124,6 +124,33 @@ static void __release_gpc(struct kvm *kvm, kvm_pfn_t p=
fn, void *khva,
 	}
 }
=20
+static kvm_pfn_t hva_to_pfn_retry(struct kvm *kvm, unsigned long uhva)
+{
+	unsigned long mmu_seq;
+	kvm_pfn_t new_pfn;
+	int retry;
+
+	do {
+		mmu_seq =3D kvm->mmu_notifier_seq;
+		smp_rmb();
+
+		/* We always request a writeable mapping */
+		new_pfn =3D hva_to_pfn(uhva, false, NULL, true, NULL);
+		if (is_error_noslot_pfn(new_pfn))
+			break;
+
+		KVM_MMU_READ_LOCK(kvm);
+		retry =3D mmu_notifier_retry_hva(kvm, mmu_seq, uhva);
+		KVM_MMU_READ_UNLOCK(kvm);
+		if (!retry)
+			break;
+
+		cond_resched();
+	} while (1);
+
+	return new_pfn;
+}
+
 int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struct gfn_to_pfn_cache =
*gpc,
 				 gpa_t gpa, unsigned long len, bool dirty)
 {
@@ -147,7 +174,7 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struc=
t gfn_to_pfn_cache *gpc,
=20
 	old_gpa =3D gpc->gpa;
 	old_pfn =3D gpc->pfn;
-	old_khva =3D gpc->khva;
+	old_khva =3D (void *)((unsigned long)gpc->khva & ~PAGE_MASK);
 	old_uhva =3D gpc->uhva;
 	old_valid =3D gpc->valid;
 	old_dirty =3D gpc->dirty;
@@ -178,8 +205,6 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struc=
t gfn_to_pfn_cache *gpc,
 	if (!old_valid || old_uhva !=3D gpc->uhva) {
 		unsigned long uhva =3D gpc->uhva;
 		void *new_khva =3D NULL;
-		unsigned long mmu_seq;
-		int retry;
=20
 		/* Placeholders for "hva is valid but not yet mapped" */
 		gpc->pfn =3D KVM_PFN_ERR_FAULT;
@@ -188,28 +213,15 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, str=
uct gfn_to_pfn_cache *gpc,
=20
 		write_unlock_irq(&gpc->lock);
=20
-	retry_map:
-		mmu_seq =3D kvm->mmu_notifier_seq;
-		smp_rmb();
-
-		/* We always request a writeable mapping */
-		new_pfn =3D hva_to_pfn(uhva, false, NULL, true, NULL);
+		new_pfn =3D hva_to_pfn_retry(kvm, uhva);
 		if (is_error_noslot_pfn(new_pfn)) {
 			ret =3D -EFAULT;
 			goto map_done;
 		}
=20
-		KVM_MMU_READ_LOCK(kvm);
-		retry =3D mmu_notifier_retry_hva(kvm, mmu_seq, uhva);
-		KVM_MMU_READ_UNLOCK(kvm);
-		if (retry) {
-			cond_resched();
-			goto retry_map;
-		}
-
 		if (gpc->kernel_map) {
 			if (new_pfn =3D=3D old_pfn) {
-				new_khva =3D (void *)((unsigned long)old_khva - page_offset);
+				new_khva =3D old_khva;
 				old_pfn =3D KVM_PFN_ERR_FAULT;
 				old_khva =3D NULL;
 			} else if (pfn_valid(new_pfn)) {
@@ -219,7 +231,9 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struc=
t gfn_to_pfn_cache *gpc,
 				new_khva =3D memremap(pfn_to_hpa(new_pfn), PAGE_SIZE, MEMREMAP_WB);
 #endif
 			}
-			if (!new_khva)
+			if (new_khva)
+				new_khva +=3D page_offset;
+			else
 				ret =3D -EFAULT;
 		}
=20
@@ -232,7 +246,7 @@ int kvm_gfn_to_pfn_cache_refresh(struct kvm *kvm, struc=
t gfn_to_pfn_cache *gpc,
 		} else {
 			/* At this point, gpc->valid may already have been cleared */
 			gpc->pfn =3D new_pfn;
-			gpc->khva =3D new_khva + page_offset;
+			gpc->khva =3D new_khva;
 		}
 	} else {
 		/* If the HVA=E2=86=92PFN mapping was already valid, don't unmap it. */

--=-tGdrPlP/CxoRpyQj0J8H
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCECow
ggUcMIIEBKADAgECAhEA4rtJSHkq7AnpxKUY8ZlYZjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjIwMTAxMjM1
OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRlYWQub3JnMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsv3wObLTCbUA7GJqKj9vHGf+Fa+tpkO+ZRVve9EpNsMsfXhvFpb8
RgL8vD+L133wK6csYoDU7zKiAo92FMUWaY1Hy6HqvVr9oevfTV3xhB5rQO1RHJoAfkvhy+wpjo7Q
cXuzkOpibq2YurVStHAiGqAOMGMXhcVGqPuGhcVcVzVUjsvEzAV9Po9K2rpZ52FE4rDkpDK1pBK+
uOAyOkgIg/cD8Kugav5tyapydeWMZRJQH1vMQ6OVT24CyAn2yXm2NgTQMS1mpzStP2ioPtTnszIQ
Ih7ASVzhV6csHb8Yrkx8mgllOyrt9Y2kWRRJFm/FPRNEurOeNV6lnYAXOymVJwIDAQABo4IB0zCC
Ac8wHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFLfuNf820LvaT4AK
xrGK3EKx1DE7MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNkd213MkBpbmZy
YWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQALbSykFusvvVkSIWttcEeifOGGKs7Wx2f5f45b
nv2ghcxK5URjUvCnJhg+soxOMoQLG6+nbhzzb2rLTdRVGbvjZH0fOOzq0LShq0EXsqnJbbuwJhK+
PnBtqX5O23PMHutP1l88AtVN+Rb72oSvnD+dK6708JqqUx2MAFLMevrhJRXLjKb2Mm+/8XBpEw+B
7DisN4TMlLB/d55WnT9UPNHmQ+3KFL7QrTO8hYExkU849g58Dn3Nw3oCbMUgny81ocrLlB2Z5fFG
Qu1AdNiBA+kg/UxzyJZpFbKfCITd5yX49bOriL692aMVDyqUvh8fP+T99PqorH4cIJP6OxSTdxKM
MIIFHDCCBASgAwIBAgIRAOK7SUh5KuwJ6cSlGPGZWGYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEwMjAwMDAwMFoXDTIyMDEwMTIz
NTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBALL98Dmy0wm1AOxiaio/bxxn/hWvraZDvmUVb3vRKTbDLH14bxaW
/EYC/Lw/i9d98CunLGKA1O8yogKPdhTFFmmNR8uh6r1a/aHr301d8YQea0DtURyaAH5L4cvsKY6O
0HF7s5DqYm6tmLq1UrRwIhqgDjBjF4XFRqj7hoXFXFc1VI7LxMwFfT6PStq6WedhROKw5KQytaQS
vrjgMjpICIP3A/CroGr+bcmqcnXljGUSUB9bzEOjlU9uAsgJ9sl5tjYE0DEtZqc0rT9oqD7U57My
ECIewElc4VenLB2/GK5MfJoJZTsq7fWNpFkUSRZvxT0TRLqznjVepZ2AFzsplScCAwEAAaOCAdMw
ggHPMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBS37jX/NtC72k+A
CsaxitxCsdQxOzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEF
BQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUwKzApBggrBgEFBQcCARYd
aHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
bC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAC20spBbrL71ZEiFrbXBHonzhhirO1sdn+X+O
W579oIXMSuVEY1LwpyYYPrKMTjKECxuvp24c829qy03UVRm742R9Hzjs6tC0oatBF7KpyW27sCYS
vj5wbal+TttzzB7rT9ZfPALVTfkW+9qEr5w/nSuu9PCaqlMdjABSzHr64SUVy4ym9jJvv/FwaRMP
gew4rDeEzJSwf3eeVp0/VDzR5kPtyhS+0K0zvIWBMZFPOPYOfA59zcN6AmzFIJ8vNaHKy5QdmeXx
RkLtQHTYgQPpIP1Mc8iWaRWynwiE3ecl+PWzq4i+vdmjFQ8qlL4fHz/k/fT6qKx+HCCT+jsUk3cS
jDCCBeYwggPOoAMCAQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf
+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcf
WlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqza
aPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDK
CMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAU
u69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8E
RTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29t
b2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
cC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2
SQgG1NgvNc3fQP7TcePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs
0j8CGpfb+SJA3GaBQ+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDM
KVmU/PUWNMKSTvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+
E2pvOUtY+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfH
M5tdhYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1t
yZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAb
R9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA4rtJSHkq7AnpxKUY8ZlYZjANBglghkgB
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEx
MjA5MjA0MDQ4WjAvBgkqhkiG9w0BCQQxIgQgNKR+2FqdFvuYYS5QlSdWvFjgvLdXA/Zk2SF3Qw/T
GQIwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBALE2mhhxIH4wj9n5zA1zicXIStKsDJdtlfqqWxmNgfPaTJCXNfnffCKDw9bUMFnM
bpypluAGM6E9cdxUq18ztElwau4NSqTaI5bgDfcUv8dDORzxSsFTc3jpEcLSrRAYXmaS6z1+XfxL
Imc8mWmfyAUJJPxA+kkubrUYpPZw5lwnlyFWRhf4rZliWJso7cE2I0AOLCPW+sgrPzP1l8lnyEia
4O1Af8HmlfeHECLYqpYwcSzJpRQMf42a7f2iIzxa+2tTNN74Eo3NsygW/XhxWnnjqTCfRdqY+GgZ
ZNUTvjeV5u3iFGEOPPDfIW3I1QQCld+3VIRi73d0iGGsBQzzQRgAAAAAAAA=


--=-tGdrPlP/CxoRpyQj0J8H--

